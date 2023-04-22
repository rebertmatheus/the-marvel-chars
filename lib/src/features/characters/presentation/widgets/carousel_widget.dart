import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_marvel_chars/src/features/characters/model/character.dart';

class CarouselWidget extends StatelessWidget {
  late final List<Character> _charactersList;

  CarouselWidget({super.key, required List<Character> charactersList}) {
    _charactersList = charactersList;
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: _charactersList.map(
        (item) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 32.sp, vertical: 36.sp),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  24.sp,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(.75),
                  spreadRadius: 12.sp,
                  blurRadius: 16.sp,
                  offset: Offset(
                    0,
                    3.sp,
                  ),
                ),
              ],
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(24.sp)),
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl: item.thumbnail?.url ?? '',
                    progressIndicatorBuilder: (context, url, downloadProgress) => Center(
                      child: CircularProgressIndicator(
                        value: downloadProgress.progress,
                      ),
                    ),
                    errorWidget: (context, url, error) => const Center(child: Icon(Icons.error_outline)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16.sp, bottom: 16.sp),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    item.name.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      backgroundColor: Colors.black.withAlpha(168),
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ).toList(),
      options: CarouselOptions(
        height: (ScreenUtil().screenHeight - ScreenUtil().statusBarHeight) * 0.4,
        aspectRatio: 16 / 9,
        viewportFraction: 0.6,
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
        initialPage: 2,
        autoPlayCurve: Curves.fastOutSlowIn,
      ),
    );
  }
}
