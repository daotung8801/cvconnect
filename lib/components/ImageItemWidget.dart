import 'package:cvconnect/components/TitleText1.dart';
import 'package:flutter/material.dart';

class ImageItemWidget extends StatelessWidget with PreferredSizeWidget {
  final String name;
  final double distance;
  final double ratingStars;
  final int numberOfReview;
  final String urlImage;

  const ImageItemWidget(
      {Key? key,
      required this.name,
      required this.distance,
      required this.ratingStars,
      required this.urlImage,
      required this.numberOfReview})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 153,
        height: 188,
        decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Column(
          children: [
            Container(
              width: 153,
              height: 92,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(urlImage),
                  fit: BoxFit.fill,
                ),
                shape: BoxShape.rectangle,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 17, left: 16),
              child: TitleText1(
                  text: name,
                  fontFamily: 'Nunito Sans',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  r: 0,
                  g: 0,
                  b: 0),
            ),
            Padding(
              padding: EdgeInsets.only(top: 7, left: 16),
              child: TitleText1(
                  text: name,
                  fontFamily: 'Nunito Sans',
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  r: 74,
                  g: 84,
                  b: 94),
            ),
            Padding(
                padding: EdgeInsets.only(top: 7, left: 16),
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 10,
                    ),
                    TitleText1(
                        text: ratingStars.toString(),
                        fontFamily: 'Nunito Sans',
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        r: 0,
                        g: 0,
                        b: 0),
                    TitleText1(
                        text: '(' + numberOfReview.toString() + 'đánh giá)',
                        fontFamily: 'Nunito Sans',
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        r: 74,
                        g: 84,
                        b: 94)
                  ],
                )),
          ],
        ));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(72);
}
