import 'dart:math';

import 'package:avatars/avatars.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cvconnect/components/DateBar.dart';
import 'package:cvconnect/objects/Doctor.dart';
import 'package:cvconnect/objects/DoctorList.dart';
import 'package:cvconnect/screens/ScheduleScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../components/DoctorInfo.dart';
import '../components/TitleText1.dart';
import '../components/widgets.dart';
import '../screens/DoctorDetailsScreen.dart';

class IndexSchedule extends Comparable{
  Doctor doctor = DoctorList().generateDoctor();
  String problem;
  DateTime selectedDate = DateTime.now();
  TimeOfDay startTime = TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);

  IndexSchedule({required this.problem, required this.selectedDate, required this.startTime}){
    // doctor = DoctorList().generateDoctor();
    // DoctorList().updateDate(doctor, int.parse(this.selectedDate.day.toString()+this.selectedDate.month.toString()));
  }

  String getTimeStringFormat() {
    DayPeriod _prd = startTime.period;
    return '${startTime.hour}:${startTime.minute} ${_prd.toString().split('.')[1].toUpperCase()}';
  }

  String getTimeRound() {
    DayPeriod _prd = startTime.period;
    return '${startTime.hour}:00 ${_prd.toString().split('.')[1].toUpperCase()}     ------------------------------------------';
  }

  @override
  int compareTo(other) {
    if (startTime.hour < other.startTime.hour) {
      return -1;
    }

    // age > other.age
    if (startTime.minute < other.startTime.minute) {
      return -1;
    }

    // age == other.age
    return 1;
  }
}

class ListSchedule extends StatelessWidget {
  List<IndexSchedule> listSchedule = <IndexSchedule>[];
  ListSchedule({required this.listSchedule});

  List<Color> colors = [
    Color.fromARGB(210, 28, 107, 164),
    Color.fromARGB(220, 224, 159, 31),
    Color.fromARGB(150, 24, 255, 255),
    Color.fromRGBO(240,124,164, 1),
    Color.fromRGBO(256,244,220, 1)
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(height: 500, child: this._buildWidget());
  }

  ListView _buildWidget() {
    List<IndexSchedule> tmp = listSchedule.where((element) => element.selectedDate.day == ScheduleScreenState.dayPicked
    && element.selectedDate.month == ScheduleScreenState.monthPicked).toList();
    return ListView.builder(
        itemCount: tmp.length,
        itemBuilder: (context, index) {
          tmp.sort();
          return Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: TitleText1(
                      text: tmp[index].getTimeRound(),
                      fontFamily: 'Nunito Sans',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      r: 125,
                      g: 150,
                      b: 181),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30, left: 35, right: 35),
                  child: DoctorInfo(
                      urlImage: tmp[index].doctor.image,
                      imageSize: 70,
                      time: tmp[index].getTimeStringFormat(),
                      doctorName: tmp[index].doctor.name,
                      faculty: tmp[index].doctor.description,
                      bigBox: this.colors.elementAt(index%colors.length)),
                ),
              ],
            ),
          );
        });
  }

}
