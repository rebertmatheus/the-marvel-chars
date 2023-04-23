// ignore_for_file: non_constant_identifier_names

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:the_marvel_chars/src/data/datasources/interface/datasources.dart';
import 'package:http/http.dart' as http;

class API implements IDataSources {
  static final API _instance = API._internal();
  factory API() => _instance;
  API._internal();

  final String URL = dotenv.env['MARVEL_URL'] ?? '';
  final String API_TS = dotenv.env['MARVEL_API_TS'] ?? '';
  final String API_KEY = dotenv.env['MARVEL_API_KEY'] ?? '';
  final String API_HASH = dotenv.env['MARVEL_API_HASH'] ?? '';

  void _addKeys(Map<String, dynamic> params) {
    params.addAll({
      'ts': API_TS,
      'apikey': API_KEY,
      'hash': API_HASH,
    });
  }

  @override
  Future<http.Response> get({required String path, required Map<String, dynamic> params}) async {
    _addKeys(params);
    var uri = Uri.https(URL, path, params.map((key, value) => MapEntry(key, value.toString())));
    return await http.get(uri);
  }
}
