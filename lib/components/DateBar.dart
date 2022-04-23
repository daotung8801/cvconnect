import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';

import '../screens/ScheduleScreen.dart';

class DateBar extends StatefulWidget {
  @override
  DateBarState createState() => DateBarState();
}

class DateBarState extends State<DateBar> {
  static int dayPicked = 1;
  static int monthPicked = 1;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(left: 35),
      child: DatePicker(
        DateTime.now(),
        height: 84,
        width: 70,
        onDateChange: (val){
          dayPicked = val.day;
          monthPicked = val.month;
          print('date changed');
          Navigator.of(context).setState(() {
          });;
        },
        initialSelectedDate: DateTime.now(),
        selectionColor: Color.fromARGB(255, 28, 107, 164),
        selectedTextColor: Colors.white,
        dateTextStyle:  TextStyle(
          fontSize: 20,
          fontFamily: 'Nunito Sans',
          fontWeight: FontWeight.w600,
          color: Color.fromARGB(255, 37, 49, 65),
        ),
      ),
    );
  }
}
