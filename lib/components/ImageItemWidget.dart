import 'package:cvconnect/components/TitleText1.dart';
import 'package:cvconnect/objects/Pharmacy.dart';
import 'package:flutter/material.dart';

class ImageItemWidget extends StatelessWidget with PreferredSizeWidget {
  Pharmacy item;

  ImageItemWidget({required this.item});

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
                  image: AssetImage(this.item.image),
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
                  text: this.item.name,
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
                  text: this.item.name,
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
                        text: this.item.ratingStar.toString(),
                        fontFamily: 'Nunito Sans',
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        r: 0,
                        g: 0,
                        b: 0),
                    TitleText1(
                        text: '(' + this.item.numOfReview.toString() + 'đánh giá)',
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
