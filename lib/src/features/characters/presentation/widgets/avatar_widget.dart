import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  late final String _imageURL;
  AvatarWidget({super.key, required String imageURL}) {
    _imageURL = imageURL;
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.grey,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: CachedNetworkImage(
          imageUrl: _imageURL,
          progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(
            value: downloadProgress.progress,
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error_outline),
        ),
      ),
    );
  }
}
