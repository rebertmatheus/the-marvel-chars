// ignore_for_file: non_constant_identifier_names

import 'package:the_marvel_chars/src/data/datasources/interface/datasources.dart';
import 'package:http/http.dart' as http;

class API implements IDataSources {
  static final API _instance = API._internal();
  factory API() => _instance;
  API._internal();

  final String URL = 'gateway.marvel.com';
  final String API_TS = 'themarvelchars';
  final String API_KEY = '31edab4db2dfa852ea35c0bef22bfe4f';
  final String API_HASH = 'b2f9da3e803acb791374f984e6056994';

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
    var result = await http.get(uri);
    return result;
  }
}
