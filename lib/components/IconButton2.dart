import 'package:flutter/material.dart';
import 'TitleText1.dart';

class IconButton2 extends StatelessWidget {
  IconButton2(
      {Key? key,
      required this.urlImage,
      required this.r,
      required this.g,
      required this.b,
      required this.radius,
      required this.buttonWeight,
      required this.buttonHeight,
      required this.screenName,
      this.onPressed})
      : super(key: key);

  String urlImage;
  int r, g, b;
  double radius;
  double buttonHeight, buttonWeight;
  String screenName;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      width: this.buttonWeight,
      height: this.buttonHeight,
      child: RaisedButton(
        onPressed: () {},
        child: Image.asset(urlImage),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(this.radius)),
        ),
        color: Color.fromARGB(255, this.r, this.g, this.b),
      ),
    );
  }
}
