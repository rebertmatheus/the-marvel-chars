import 'package:result_dart/result_dart.dart';
import 'package:the_marvel_chars/src/domain/models/character.dart';

abstract class ICharactersRepository {
  AsyncResult<List<Character>, Exception> getAll();
}
