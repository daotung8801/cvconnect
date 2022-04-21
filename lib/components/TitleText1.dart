import 'package:flutter/material.dart';

class TitleText1 extends StatelessWidget {
  TitleText1(
      {Key? key,
      required this.text,
      required this.fontFamily,
      required this.fontSize,
      required this.fontWeight,
      required this.r,
      required this.g,
      required this.b})
      : super(key: key);

  String text, fontFamily;
  double fontSize;
  FontWeight fontWeight;
  int r, g, b;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      this.text,
      style: TextStyle(
        fontFamily: this.fontFamily,
        fontSize: this.fontSize,
        fontWeight: this.fontWeight,
        color: Color.fromARGB(255, this.r, this.g, this.b),
      ),
    );
  }
}
