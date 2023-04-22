import 'dart:convert';
import 'dart:io';
import 'package:result_dart/result_dart.dart';
import 'package:the_marvel_chars/src/data/datasources/interface/datasources.dart';
import 'package:the_marvel_chars/src/features/characters/model/character.dart';
import 'package:the_marvel_chars/src/features/characters/model/thumbnail.dart';
import 'package:the_marvel_chars/src/features/characters/repository/characters_repository.dart';

class CharactersRepository implements ICharactersRepository {
  final String _path = '/v1/public/characters';
  late final IDataSources _api;

  CharactersRepository({required IDataSources api}) {
    _api = api;
  }

  @override
  AsyncResult<List<Character>, Exception> getAll({required Map<String, dynamic> params}) async {
    try {
      final response = await _api.get(path: _path, params: params);
      List<Character> charsList = [];
      final data = json.decode(response.body);
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
