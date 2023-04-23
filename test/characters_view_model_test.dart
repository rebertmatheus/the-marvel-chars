import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:result_dart/result_dart.dart';
import 'package:the_marvel_chars/src/features/characters/model/character.dart';
import 'package:the_marvel_chars/src/features/characters/repository/characters_repository.dart';
import 'package:the_marvel_chars/src/features/characters/view_model/characters_view_model.dart';
import 'package:the_marvel_chars/src/features/characters/view_model/characters_view_model_imp.dart';
import 'package:the_marvel_chars/src/utils/exceptions/characters_exception.dart';

import 'characters_view_model_test.mocks.dart';
import 'mocks/character+mock.dart';

@GenerateNiceMocks([MockSpec<ICharactersRepository>()])
void main() {
  late ICharactersRepository repository;
  late ICharactersViewModel viewModel;
  late Map<String, dynamic> params;

  setUp(() {
    repository = MockICharactersRepository();
    viewModel = CharactersViewModel(repository: repository);
    params = {'limit': 100, 'offset': 0};
  });

  group('Characters ViewModel', () {
    group('Should return with succeess', () {
      setUp(() {
        when(repository.getAll(params: params)).thenAnswer((_) async => Future.value(Result.success(Character().mock())));
      });

      test('Should return a valid Result.', () async {
        final result = await viewModel.fetchCharacters();

        expect(result, isInstanceOf<Result>());
      });

      test('Should return a valid list.', () async {
        await viewModel.fetchCharacters();

        expect(viewModel.charactersList.length, greaterThan(0));
      });
    });

    group('Should return with failure', () {
      setUp(() {
        when(repository.getAll(params: params)).thenAnswer((_) async => Future.value(Result.failure(CharactersException('Data not found!!!'))));
      });

      test('Should return a valid Failure instance.', () async {
        final result = await viewModel.fetchCharacters();
        var exception;

        result.fold((success) {}, (failure) {
          exception = failure;
        });

        expect(exception, isInstanceOf<CharactersException>());
      });

      test('Should return an error message', () async {
        final result = await viewModel.fetchCharacters();
        var exception;

        result.fold((success) {}, (failure) {
          exception = failure;
        });

        expect(exception.toString(), equals('Data not found!!!'));
      });
    });
  });
}
