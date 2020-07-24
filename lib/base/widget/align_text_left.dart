import 'package:flutter/material.dart';

class AlignTextLeft extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final fontWeigh;

//  AlignTextLeft(this.text, this.fontSize);
  AlignTextLeft({Key key, @required this.text, this.fontSize = 14, this.color = Colors.black, this.fontWeigh =  FontWeight.normal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Align(
        alignment: Alignment.topLeft,
        child: Text(
          text,
          textAlign: TextAlign.left,

          style: TextStyle(fontSize: this.fontSize, color: this.color, decoration: TextDecoration.none,
              fontWeight: this.fontWeigh),
        ));
  }
}
