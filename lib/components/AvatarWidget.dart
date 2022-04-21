import 'package:flutter/cupertino.dart';

class AvatarWidget extends StatelessWidget {
  final double height;
  final double width;
  final String urlImage;
  final double radius;

  const AvatarWidget(
      {Key? key,
      required this.height,
      required this.width,
      required this.urlImage,
      required this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(urlImage),
          fit: BoxFit.fill,
        ),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
    );
  }
}
