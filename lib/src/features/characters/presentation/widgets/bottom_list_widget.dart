import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_marvel_chars/src/features/characters/model/character.dart';
import 'package:the_marvel_chars/src/features/characters/presentation/widgets/avatar_widget.dart';

class BottomListWidget extends StatelessWidget {
  late final List<Character> _charactersList;
  late final ScrollController _controller;

  BottomListWidget({super.key, required List<Character> charactersList, required ScrollController controller}) {
    _charactersList = charactersList;
    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: _controller,
      itemBuilder: (context, int index) {
        if (index < _charactersList.length) {
          return ListTile(
            leading: AvatarWidget(
              imageURL: _charactersList[index].thumbnail?.url ?? '',
            ),
            title: Text(_charactersList[index].name ?? ''),
            subtitle: Text(_charactersList[index].description != "" ? _charactersList[index].description.toString() : 'Character description not available...',
                overflow: TextOverflow.ellipsis),
          );
        } else {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 12.sp),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
      separatorBuilder: (_, __) => const Divider(),
      itemCount: _charactersList.length + 1,
    );
  }
}
