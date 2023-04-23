import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:result_dart/result_dart.dart';
import 'package:the_marvel_chars/src/data/datasources/interface/datasources.dart';
import 'package:the_marvel_chars/src/features/characters/model/character.dart';
import 'package:the_marvel_chars/src/features/characters/repository/characters_repository_imp.dart';
import 'package:the_marvel_chars/src/utils/exceptions/characters_exception.dart';
import 'characters_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<IDataSources>()])
void main() {
  late MockIDataSources api;
  late CharactersRepository repository;
  late Map<String, dynamic> params;
  late String charactersJson;

  setUp(() {
    api = MockIDataSources();
    repository = CharactersRepository(api: api);
    params = {'limit': 100, 'offset': 0};
    charactersJson = File('${Directory.current.path}/test/json/characters.json').readAsStringSync();
  });

  group('Characters Repository', () {
    group('Should return with succeess', () {
      setUp(() {
        when(api.get(path: anyNamed('path'), params: anyNamed('params'))).thenAnswer((_) async => Future.value(Response(charactersJson, 200)));
      });

      test('Should return a valid Result.', () async {
        final result = await repository.getAll(params: params);

        expect(result, isInstanceOf<Result>());
      });

      test('Should return a valid list.', () async {
        final result = await repository.getAll(params: params);
        List<Character> list = [];

        result.fold((success) {
          list = success;
        }, (failure) {});

        expect(list.length, greaterThan(0));
      });
    });

    group('Should return with failure', () {
      setUp(() {
        when(api.get(path: anyNamed('path'), params: anyNamed('params'))).thenAnswer((_) async => Future.value(Response('{"code": 500}', 500)));
      });

      test('Should return a valid Result.', () async {
        final result = await repository.getAll(params: params);

        expect(result, isInstanceOf<Result>());
      });

      test('Should return a valid Failure instance.', () async {
        final result = await repository.getAll(params: params);
        var exception;

        result.fold((success) {}, (failure) {
          exception = failure;
        });

        expect(exception, isInstanceOf<CharactersException>());
      });

      test('Should return an error message', () async {
        final result = await repository.getAll(params: params);
        var exception;

        result.fold((success) {}, (failure) {
          exception = failure;
        });

        expect(exception.toString(), equals('Data not found!!!'));
      });
    });
  });
}
