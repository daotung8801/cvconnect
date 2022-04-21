import 'package:cvconnect/components/TitleText1.dart';
import 'package:flutter/material.dart';

class BigHeaderWidget extends StatelessWidget {
  final String text;

  const BigHeaderWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 0, top: 25),
          child: TitleText1(
            text: text,
            fontFamily: 'Nunito Sans',
            fontSize: 27,
            fontWeight: FontWeight.bold,
            r: 0,
            g: 0,
            b: 0,
          ),
        ),
      ),
      //debugShowCheckedModeBanner: false,
    );
  }
}
