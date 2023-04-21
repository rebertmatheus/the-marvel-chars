import 'package:http/http.dart' as http;

abstract class IDataSources {
  Future<http.Response> get({required String path, required Map<String, dynamic> params});
}
