import 'package:result_dart/result_dart.dart';
import 'package:the_marvel_chars/src/features/characters/model/character.dart';
import 'package:the_marvel_chars/src/features/characters/repository/characters_repository.dart';
import 'package:the_marvel_chars/src/features/characters/view_model/characters_view_model.dart';

class CharactersViewModel implements ICharactersViewModel {
  late final ICharactersRepository _repository;
  final Map<String, dynamic> _params = {'limit': 100, 'offset': 0};
  int _offsetMultiplier = 0;
  final List<Character> _charactersList = [];

  @override
  List<Character> get charactersList => _charactersList;

  CharactersViewModel({required ICharactersRepository repository}) {
    _repository = repository;
  }

  @override
  void increaseOffsetMultiplier() {
    _offsetMultiplier++;
  }

  @override
  AsyncResult<bool, Exception> fetchCharacters() async {
    try {
      _params['offset'] = _params['limit'] * _offsetMultiplier;
      final result = await _repository.getAll(params: _params);
      result.fold(
        (success) {
          _charactersList.addAll(success);
        },
        (failure) {
          return Failure(failure.toString());
        },
      );
      return const Success(true);
    } on Exception catch (ex) {
      return Failure(ex);
    }
  }
}
