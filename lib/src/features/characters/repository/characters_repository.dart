import 'package:result_dart/result_dart.dart';
import 'package:the_marvel_chars/src/features/characters/model/character.dart';

abstract class ICharactersRepository {
  AsyncResult<List<Character>, Exception> getAll({required Map<String, dynamic> params});
}
