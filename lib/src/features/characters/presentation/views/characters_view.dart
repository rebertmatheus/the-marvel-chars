import 'package:flutter/material.dart';
import 'package:the_marvel_chars/src/features/characters/presentation/controllers/characters_view_controller.dart';
import 'package:the_marvel_chars/src/features/characters/presentation/widgets/avatar_widget.dart';
import 'package:the_marvel_chars/src/utils/enums/status_enum.dart';

class CharactersView extends StatelessWidget {
  late final ICharactersViewController _viewController;

  CharactersView({super.key, required ICharactersViewController viewController}) {
    _viewController = viewController;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: ValueListenableBuilder<Status>(
        valueListenable: _viewController.status,
        builder: (context, status, _) {
          if (status == Status.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.separated(
            itemBuilder: (context, int index) => ListTile(
              leading: AvatarWidget(
                imageURL: _viewController.characters[index].thumbnail?.url ?? '',
              ),
              title: Container(
                color: Colors.blue,
              ),
            ),
            separatorBuilder: (_, __) => const Divider(),
            itemCount: _viewController.characters.length,
          );
        },
      ),
    );
  }
}
