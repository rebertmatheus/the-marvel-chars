import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_marvel_chars/src/features/characters/presentation/controllers/characters_view_controller.dart';
import 'package:the_marvel_chars/src/features/characters/presentation/widgets/bottom_list_widget.dart';
import 'package:the_marvel_chars/src/features/characters/presentation/widgets/carousel_widget.dart';
import 'package:the_marvel_chars/src/utils/enums/status_enum.dart';

class CharactersView extends StatelessWidget {
  late final ICharactersViewController _viewController;

  CharactersView({super.key, required ICharactersViewController viewController}) {
    _viewController = viewController;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Marvel\'s Characters'),
      ),
      body: ValueListenableBuilder<Status>(
        valueListenable: _viewController.status,
        builder: (context, status, _) {
          if (status == Status.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Column(
            children: [
              CarouselWidget(charactersList: _viewController.topCharacters),
              SizedBox(
                height: ((ScreenUtil().screenHeight - ScreenUtil().statusBarHeight) * 0.5),
                child: BottomListWidget(
                  charactersList: _viewController.bottomCharacters,
                  controller: _viewController.scrollController,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
