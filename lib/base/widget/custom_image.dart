import 'package:flutter/material.dart';
import 'package:movie_database_app/res/AppImage.dart';
import 'package:movie_database_app/util/Constant.dart';

class LoadImage extends StatelessWidget {
  final String path;

  LoadImage({Key key, this.path}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: path.length > 0
          ? FadeInImage.assetNetwork(
              fit: BoxFit.cover,
              placeholder: AppImage.IMG_HOTGIRL,
              image: ImageURL.getImageUrl(path))
          : Image(
              image: AssetImage(AppImage.IMG_HOTGIRL),
              fit: BoxFit.cover,
            ),
    );
  }
}
