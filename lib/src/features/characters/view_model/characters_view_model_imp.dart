import 'package:result_dart/result_dart.dart';
import 'package:the_marvel_chars/src/features/characters/model/character.dart';
import 'package:the_marvel_chars/src/features/characters/repository/characters_repository.dart';
import 'package:the_marvel_chars/src/features/characters/view_model/characters_view_model.dart';
import 'package:the_marvel_chars/src/utils/exceptions/characters_exception.dart';

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
  AsyncResult<bool, CharactersException> fetchCharacters() async {
    try {
      _params['offset'] = _params['limit'] * _offsetMultiplier;
      final response = await _repository.getAll(params: _params);
      return response.fold(
        (success) {
          _charactersList.addAll(success);
          return const Success(true);
        },
        (failure) {
          return Failure(failure);
        },
      );
    } on Exception catch (ex) {
      return Failure(CharactersException(ex.toString()));
    }
  }
}
