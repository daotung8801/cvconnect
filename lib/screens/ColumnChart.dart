import 'package:flutter/material.dart';
import '../components/ColumnChartTabBar.dart';
import '../components/TitleText1.dart';

class ColumnChart extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Padding(
            padding: EdgeInsets.only(top: 10),
            child: TitleText1(text: 'Biểu đồ', fontFamily: 'Inter', fontSize: 25, fontWeight: FontWeight.bold, r: 0, g: 0, b: 0),
          ),
          backgroundColor: Colors.transparent,
          toolbarHeight: 100,
          elevation: 0.0,
          leading: Builder(
            builder: (context) => Container(
              child: IconButton(
                color: Color.fromARGB(255, 0, 0, 0),
                padding: EdgeInsets.only(left: 32, top: 10),
                iconSize: 30,
                icon: Icon(Icons.arrow_back_sharp),
                tooltip: 'Menu',
                onPressed: () => {Navigator.pop(context)},
              ),
            ),
          ),
        ),
        body:
            ColumnChartTabBar(),
    );
  }
}