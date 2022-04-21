import 'package:cvconnect/components/DateBar.dart';
import 'package:flutter/material.dart';
import '../components/TitleText1.dart';

class ScheduleScreen extends StatefulWidget {
  @override
  ScheduleScreenState createState() => ScheduleScreenState();
}
class ScheduleScreenState extends State<ScheduleScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Padding(
        padding: EdgeInsets.only(left: 28),
        child: TitleText1(
            text: 'Đặt lịch',
            fontFamily: 'Nunito Sans',
            fontSize: 27,
            fontWeight: FontWeight.bold,
            r: 37,
            g: 49,
            b: 65),
      ),
      actions: <Widget>[
        IconButton(
          padding: EdgeInsets.only(right: 40),
          iconSize: 30,
          icon: Icon(Icons.calendar_today),
          color: Color.fromARGB(255, 123, 141, 158),
          tooltip: 'Tìm kiếm',
          onPressed: () => {},
        ),
      ],
      backgroundColor: Colors.transparent,
      toolbarHeight: 80,
      elevation: 0.0,
    ),
    body: Column(
      children: [
        DateBar(),
      ],
    ),
  );
}
