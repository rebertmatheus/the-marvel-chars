import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:result_dart/result_dart.dart';
import 'package:the_marvel_chars/src/features/characters/model/character.dart';
import 'package:the_marvel_chars/src/features/characters/presentation/controllers/characters_view_controller.dart';
import 'package:the_marvel_chars/src/features/characters/presentation/controllers/characters_view_controller_imp.dart';
import 'package:the_marvel_chars/src/features/characters/view_model/characters_view_model.dart';
import 'package:the_marvel_chars/src/utils/exceptions/characters_exception.dart';
import 'characters_view_controller_test.mocks.dart';
import 'mocks/character+mock.dart';

@GenerateNiceMocks([MockSpec<ICharactersViewModel>()])
void main() {
  late ICharactersViewModel viewModel;
  late ICharactersViewController viewController;

  setUp(() {
    viewModel = MockICharactersViewModel();
  });

  group('Characters ViewController', () {
    group('Should return a characters\' list', () {
      setUp(() {
        when(viewModel.fetchCharacters()).thenAnswer((_) async => Future.value(Result.success(true)));
        when(viewModel.charactersList).thenReturn(Character().mock());
        viewController = CharactersViewController(viewModel: viewModel);
      });

      test('Should return a full list.', () {
        final list = viewController.allCharacters;

        expect(list.length, equals(12));
      });

      test('Should return a bottom list.', () {
        final bottomList = viewController.bottomCharacters;

        expect(bottomList.length, equals(7));
      });

      test('Should return a top list.', () {
        final topList = viewController.topCharacters;

        expect(topList.length, equals(5));
      });
    });

    group('Should return failure', () {
      setUp(() {
        when(viewModel.fetchCharacters()).thenAnswer((_) async => Future.value(Result.failure(CharactersException('Data not found!!!'))));
        viewController = CharactersViewController(viewModel: viewModel);
      });

      test('Should return an error message', () async {
        viewController.fetchCharacters();
        expect(viewController.errorMessage, equals('Data not found!!!'));
      });
    });
  });
}
