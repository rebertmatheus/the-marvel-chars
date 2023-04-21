import 'package:flutter/material.dart';
import 'package:the_marvel_chars/src/features/characters/model/character.dart';
import 'package:the_marvel_chars/src/utils/enums/status_enum.dart';

abstract class ICharactersViewController {
  ValueNotifier<Status> get status;
  List<Character> get characters;

  void fetchCharacters();
  void updateCharacters();
}
