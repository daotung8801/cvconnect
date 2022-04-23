import 'package:flutter/material.dart';

import 'TitleText1.dart';

class DoctorInforContainer extends StatelessWidget {
  String text1, text2;
  DoctorInforContainer({
    required this.text1,
    required this.text2,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 110,
      height: 110,
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: TitleText1(
                text: this.text1,
                fontFamily: 'Nunito Sans',
                fontSize: 16,
                fontWeight: FontWeight.normal,
                r: 0,
                g: 0,
                b: 0),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: TitleText1(
                text: this.text2,
                fontFamily: 'Nunito Sans',
                fontSize: 22,
                fontWeight: FontWeight.bold,
                r: 0,
                g: 0,
                b: 0),
          ),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: Color.fromARGB(255, 232, 235, 237),
      ),
    );
  }
}
