import 'dart:convert';
import 'dart:io';
import 'package:result_dart/result_dart.dart';
import 'package:the_marvel_chars/src/data/datasources/remote/api.dart';
import 'package:the_marvel_chars/src/domain/models/character.dart';
import 'package:the_marvel_chars/src/domain/models/thumbnail.dart';
import 'package:the_marvel_chars/src/domain/repositories/characters_repository.dart';

class CharactersRepository implements ICharactersRepository {
  final String _path = '/v1/public/characters';
  final Map<String, dynamic> _params = {'limit': 100, 'offset': 0};

  @override
  AsyncResult<List<Character>, Exception> getAll() async {
    try {
      final response = await API().get(path: _path, params: _params);
      List<Character> charsList = [];
      final data = json.decode(response.body);
      print(response);
      for (var json in data['data']['results']) {
        var char = Character(
            id: json['id'],
            name: json['name'],
            description: json['description'],
            modified: json['modified'],
            thumbnail: json['thumbnail'] != null ? Thumbnail.fromJson(json['thumbnail']) : null);
        charsList.add(char);
      }

      return Success(charsList);
    } on HttpException catch (e) {
      print(e);
      return Failure(Exception(e.message));
    }
  }
}
