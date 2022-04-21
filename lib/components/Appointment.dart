import 'package:flutter/material.dart';

import 'TitleText1.dart';

class Appointment extends StatelessWidget {
  String day1, day2, time, doctorName, faculty;
  Color smallBox, bigBox;

  Appointment({
    Key? key,
    required this.day1,
    required this.day2,
    required this.time,
    required this.doctorName,
    required this.faculty,
    required this.smallBox,
    required this.bigBox,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 280,
      height: 120,
      child: Row(children: <Widget>[
        Center(
          child: Padding(
            padding: EdgeInsets.only(left: 18, bottom: 12, top: 12),
            child: Container(
              width: 70,
              height: 100,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 14),
                      child: TitleText1(
                        text: this.day1,
                        fontFamily: 'Nunito Sans',
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        r: 255,
                        g: 255,
                        b: 255,
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: TitleText1(
                        text: this.day2,
                        fontFamily: 'Nunito Sans',
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        r: 255,
                        g: 255,
                        b: 255,
                      ),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: this.smallBox,
              ),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 18, top: 18),
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
