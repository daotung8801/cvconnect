import 'package:cvconnect/components/DateBar.dart';
import 'package:cvconnect/components/DoctorInfo.dart';
import 'package:flutter/material.dart';
import '../components/TitleText1.dart';
import 'CreateSchedule.dart';

class ScheduleScreen extends StatefulWidget {
  @override
  ScheduleScreenState createState() => ScheduleScreenState();
}

class ScheduleScreenState extends State<ScheduleScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: EdgeInsets.only(left: 20),
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
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateSchedule(),
                  ),
                ),
              },
            ),
          ],
          backgroundColor: Colors.transparent,
          toolbarHeight: 80,
          elevation: 0.0,
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DateBar(),
            Padding(
              padding: EdgeInsets.only(top: 30, left: 35),
              child: TitleText1(
                  text: '12:00 PM   ------------------------------------------',
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
                  urlImage:
                      'https://starboard-media.s3.amazonaws.com/v/thumb-00C-wcCpq-00001.jpg',
                  imageSize: 70,
                  time: '12:30 PM',
                  doctorName: 'Nguyễn Văn Phúc',
                  faculty: 'Bác sĩ tâm lý',
                  bigBox: Color.fromARGB(210, 28, 107, 164)),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30, left: 35, right: 35),
              child: TitleText1(
                  text: '10:00 PM   ------------------------------------------',
                  fontFamily: 'Nunito Sans',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  r: 125,
                  g: 150,
                  b: 181),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 35, right: 35),
              child: DoctorInfo(
                  urlImage:
                  'https://img.freepik.com/free-photo/pleased-young-female-doctor-wearing-medical-robe-stethoscope-around-neck-standing-with-closed-posture_409827-254.jpg?w=2000',
                  imageSize: 70,
                  time: '10:25 PM',
                  doctorName: 'Đinh Thị Mai',
                  faculty: 'Bác sĩ tim mạch',
                  bigBox: Color.fromARGB(200, 233, 116, 159)),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30, left: 35, right: 35),
              child: TitleText1(
                  text: '05:00 PM   ------------------------------------------',
                  fontFamily: 'Nunito Sans',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  r: 125,
                  g: 150,
                  b: 181),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 35, right: 35),
              child: DoctorInfo(
                  urlImage:
                  'https://media.istockphoto.com/photos/happy-healthcare-practitioner-picture-id138205019?k=20&m=138205019&s=612x612&w=0&h=KpsSMVsplkOqTnAJmOye4y6DcciVYIBe5dYDgYXLVW4=',
                  imageSize: 70,
                  time: '05:20 PM',
                  doctorName: 'Trần Đức Anh',
                  faculty: 'Bác sĩ tim mạch',
                  bigBox: Color.fromARGB(220, 224, 159, 31)),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30, left: 35, right: 35),
              child: TitleText1(
                  text: '09:00 AM   ------------------------------------------',
                  fontFamily: 'Nunito Sans',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  r: 125,
                  g: 150,
                  b: 181),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 35, right: 35, bottom: 40),
              child: DoctorInfo(
                  urlImage:
                  'https://media.istockphoto.com/photos/portrait-of-male-doctor-in-white-coat-and-stethoscope-standing-in-picture-id1327024466?b=1&k=20&m=1327024466&s=170667a&w=0&h=vcw4Exhv4pkR8fMVLNXhNESaKq1HbYwJ1iElLlQBxI0=',
                  imageSize: 70,
                  time: '09:45 AM',
                  doctorName: 'Lê Minh Khôi',
                  faculty: 'Bác sĩ phổi',
                  bigBox: Color.fromARGB(150, 24, 255, 255)),
            ),
          ],
        ),
      );
}
