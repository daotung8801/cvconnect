import 'package:avatars/avatars.dart';
import 'package:cvconnect/components/widgets.dart';
import 'package:flutter/material.dart';

import 'TitleText1.dart';

class DoctorInfo extends StatelessWidget {
  String urlImage, time, doctorName, faculty;
  double imageSize;
  Color bigBox;

  DoctorInfo({
    Key? key,
    required this.urlImage,
    required this.imageSize,
    required this.time,
    required this.doctorName,
    required this.faculty,
    required this.bigBox,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 320,
      height: 120,
      child: Row(children: <Widget>[
        Center(
          child: Padding(
            padding: EdgeInsets.only(left: 18, bottom: 12, top: 8),
            child: Avatar(
              shape: CustomAvatarStyle.borderRadius20(size: this.imageSize),
              sources: [NetworkSource(this.urlImage)],
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 18, top: 26),
              child: TitleText1(
                  text: this.time,
                  fontFamily: 'Nunito Sans',
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  r: 255,
                  g: 255,
                  b: 255),
            ),
            Padding(
              padding: EdgeInsets.only(left: 18, top: 5),
              child: TitleText1(
                  text: this.doctorName,
                  fontFamily: 'Nunito Sans',
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  r: 255,
                  g: 255,
                  b: 255),
            ),
            Padding(
              padding: EdgeInsets.only(left: 18, top: 5),
              child: TitleText1(
                text: this.faculty,
                fontFamily: 'Nunito Sans',
                fontSize: 15,
                fontWeight: FontWeight.normal,
                r: 255,
                g: 255,
                b: 255,
              ),
            ),
          ],
        ),
      ]),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: this.bigBox,
      ),
    );
  }
}
