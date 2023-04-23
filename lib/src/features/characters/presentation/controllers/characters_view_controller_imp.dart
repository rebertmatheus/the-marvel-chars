import 'package:flutter/material.dart';
import 'package:the_marvel_chars/src/features/characters/model/character.dart';
import 'package:the_marvel_chars/src/features/characters/presentation/controllers/characters_view_controller.dart';
import 'package:the_marvel_chars/src/features/characters/view_model/characters_view_model.dart';
import 'package:the_marvel_chars/src/utils/enums/status_enum.dart';

class CharactersViewController extends ChangeNotifier implements ICharactersViewController {
  final ValueNotifier<Status> _status = ValueNotifier(Status.loading);
  late final ICharactersViewModel _viewModel;
  final ScrollController _scrollController = ScrollController();
  String _errorMessage = '';

  CharactersViewController({required ICharactersViewModel viewModel}) {
    _status.value = Status.loading;
    _viewModel = viewModel;
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent == _scrollController.offset) {
        updateCharacters();
      }
    });
    fetchCharacters();
  }

  @override
  ValueNotifier<Status> get status => _status;

  @override
  List<Character> get allCharacters => _viewModel.charactersList;

  @override
  List<Character> get bottomCharacters => _viewModel.charactersList.sublist(5, _viewModel.charactersList.length);

  @override
  List<Character> get topCharacters => _viewModel.charactersList.sublist(0, 5);

  @override
  ScrollController get scrollController => _scrollController;

  @override
  String get errorMessage => _errorMessage;

  @override
  Future fetchCharacters() async {
    final result = await _viewModel.fetchCharacters();
    result.fold(
      (success) {
        _status.value = Status.success;
        notifyListeners();
      },
      (failure) {
        _status.value = Status.failure;
        _errorMessage = failure.toString();
        notifyListeners();
      },
    );
  }

  @override
  void updateCharacters() {
    _status.value = Status.updating;
    _viewModel.increaseOffsetMultiplier();
    fetchCharacters();
  }
}
