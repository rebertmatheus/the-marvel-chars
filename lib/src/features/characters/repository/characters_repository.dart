import 'package:result_dart/result_dart.dart';
import 'package:the_marvel_chars/src/features/characters/model/character.dart';
import 'package:the_marvel_chars/src/utils/exceptions/characters_exception.dart';

abstract class ICharactersRepository {
  AsyncResult<List<Character>, CharactersException> getAll({required Map<String, dynamic> params});
}
