import 'package:flutter/material.dart';

class MoveItem extends StatelessWidget {
  final String urlImage;
  final String titleMove;

  MoveItem({Key key, this.urlImage, this.titleMove}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(0),
          child: Image(image: AssetImage(this.urlImage)),
        ),
        Container(
          child: Text(
            this.titleMove,
            style: TextStyle(fontSize: 18),
          ),
        )
      ],
    );
  }
}
