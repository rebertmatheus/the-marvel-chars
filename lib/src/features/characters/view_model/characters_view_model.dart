import 'package:result_dart/result_dart.dart';
import 'package:the_marvel_chars/src/features/characters/model/character.dart';
import 'package:the_marvel_chars/src/utils/exceptions/characters_exception.dart';

abstract class ICharactersViewModel {
  List<Character> get charactersList;
  void increaseOffsetMultiplier();
  AsyncResult<bool, CharactersException> fetchCharacters();
}
