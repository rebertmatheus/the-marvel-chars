import 'package:flutter/material.dart';
import 'package:the_marvel_chars/src/features/characters/model/character.dart';
import 'package:the_marvel_chars/src/features/characters/presentation/controllers/characters_view_controller.dart';
import 'package:the_marvel_chars/src/features/characters/view_model/characters_view_model.dart';
import 'package:the_marvel_chars/src/utils/enums/status_enum.dart';

class CharactersViewController extends ChangeNotifier implements ICharactersViewController {
  final ValueNotifier<Status> _status = ValueNotifier(Status.loading);
  late final ICharactersViewModel _viewModel;

  CharactersViewController({required ICharactersViewModel viewModel}) {
    _viewModel = viewModel;
    fetchCharacters();
  }

  @override
  ValueNotifier<Status> get status => _status;

  @override
  List<Character> get characters => _viewModel.charactersList;

  @override
  Future fetchCharacters() async {
    _status.value = Status.loading;
    final result = await _viewModel.fetchCharacters();
    result.fold(
      (success) {
        _status.value = Status.success;
        notifyListeners();
      },
      (failure) {
        _status.value = Status.failure;
        notifyListeners();
      },
    );
  }

  @override
  void updateCharacters() {
    _status.value = Status.loading;
    _viewModel.increaseOffsetMultiplier();
    fetchCharacters();
  }
}
