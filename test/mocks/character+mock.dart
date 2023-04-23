import 'dart:convert';
import 'dart:io';

import 'package:the_marvel_chars/src/features/characters/model/character.dart';

extension MockCharacter on Character {
  List<Character> mock() {
    List<Character> list = [];
    String charactersJson = File('${Directory.current.path}/test/json/characters.json').readAsStringSync();
    final data = json.decode(charactersJson);
    for (var json in data['data']['results']) {
      list.add(Character.fromJson(json));
    }

    return list;
  }
}
