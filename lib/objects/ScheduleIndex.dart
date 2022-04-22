import 'dart:math';

import 'package:avatars/avatars.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cvconnect/components/DateBar.dart';
import 'package:cvconnect/objects/Doctor.dart';
import 'package:cvconnect/screens/ScheduleScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../components/DoctorInfo.dart';
import '../components/TitleText1.dart';
import '../components/widgets.dart';
import '../screens/DoctorDetailsScreen.dart';

class IndexSchedule extends Comparable{
  List<Doctor> listRandomDoctor = [
    new Doctor(12345, "Trịnh Thị Thu", "Bác sĩ đa khoa", 100, "https://img.freepik.com/free-photo/pleased-young-female-doctor-wearing-medical-robe-stethoscope-around-neck-standing-with-closed-posture_409827-254.jpg?w=2000"),
    new Doctor(123456, "Lê Thị Vân", "Bác sĩ tâm lí", 50, "https://img.freepik.com/free-photo/pleased-young-female-doctor-wearing-medical-robe-stethoscope-around-neck-standing-with-closed-posture_409827-254.jpg?w=2000"),
    new Doctor(1234567, "Nguyễn Thị Hà", "Bác sĩ nha khoa", 80, "https://img.freepik.com/free-photo/beautiful-young-female-doctor-looking-camera-office_1301-7807.jpg?w=2000"),
    new Doctor(12345678, "Bùi Văn Đức", "Bác sĩ phụ sản", 200, "https://starboard-media.s3.amazonaws.com/v/thumb-00C-wcCpq-00001.jpg"),
    new Doctor(123456789, "Trần Văn Đức", "Bác sĩ phổi", 120, "https://media.istockphoto.com/photos/happy-healthcare-practitioner-picture-id138205019?k=20&m=138205019&s=612x612&w=0&h=KpsSMVsplkOqTnAJmOye4y6DcciVYIBe5dYDgYXLVW4="),
    new Doctor(1234, "Bùi Minh Hoa", "Chuyên gia tư vấn", 20, "https://media.istockphoto.com/photos/portrait-of-male-doctor-in-white-coat-and-stethoscope-standing-in-picture-id1327024466?b=1&k=20&m=1327024466&s=170667a&w=0&h=vcw4Exhv4pkR8fMVLNXhNESaKq1HbYwJ1iElLlQBxI0=")
  ];

  Doctor doctor = new Doctor(123, "name", "description", 100, "image");
  String problem;
  DateTime selectedDate = DateTime.now();
  TimeOfDay startTime = TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);

  IndexSchedule({required this.problem, required this.selectedDate, required this.startTime}){
    doctor = listRandomDoctor.elementAt(Random().nextInt(listRandomDoctor.length));
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

  void add(IndexSchedule indexSchedule) {
    listSchedule.add(indexSchedule);
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
