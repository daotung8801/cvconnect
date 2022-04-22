import 'package:cvconnect/screens/DoctorsScreen.dart';
import 'package:flutter/material.dart';
import '../components/Appointment.dart';
import '../components/AvatarWidget.dart';
import '../components/IconButton2.dart';
import '../components/TitleText1.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Row(children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(children: <Widget>[
                  IconButton(
                    iconSize: 18,
                    icon: Icon(Icons.waving_hand_rounded),
                    color: Color.fromARGB(255, 224, 159, 31),
                    tooltip: 'Menu',
                    onPressed: () => {},
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 0),
                    child: TitleText1(
                        text: 'Xin chào!',
                        fontFamily: 'Nunito Sans',
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        r: 37,
                        g: 49,
                        b: 65),
                  ),
                ]),
                Padding(
                  padding: EdgeInsets.only(left: 14),
                  child: TitleText1(
                      text: 'Nguyễn Thái',
                      fontFamily: 'Nunito Sans',
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      r: 37,
                      g: 49,
                      b: 65),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 100),
              child: AvatarWidget(
                  height: 58,
                  width: 60,
                  urlImage: 'assets/images/header_icon.png',
                  radius: 18),
            ),
          ]),
          backgroundColor: Colors.transparent,
          toolbarHeight: 110,
          elevation: 0.0,
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 30),
            ),
          ],
        ),
        body: ListView(
          children: <Widget>[
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 5),
                child: Container(
                  width: 314,
                  height: 60,
                  child: GestureDetector(
                    onTap: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20, top: 5),
                          child: Icon(Icons.search,
                              size: 25,
                              color: Color.fromARGB(255, 189, 189, 189)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5, top: 5),
                          child: TitleText1(
                            text: 'Tìm kiếm dịch vụ',
                            fontFamily: 'Nunito Sans',
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            r: 189,
                            g: 189,
                            b: 189,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 110, top: 5),
                          child: Icon(Icons.tune,
                              size: 25, color: Color.fromARGB(255, 14, 16, 18)),
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(255, 238, 246, 255),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40, top: 20),
              child: TitleText1(
                text: 'Dịch vụ',
                fontFamily: 'Nunito Sans',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                r: 14,
                g: 16,
                b: 18,
              ),
            ),
            Row(children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 33, top: 20),
                child: IconButton2(
                  urlImage: 'assets/images/doctor_icon.png',
                  r: 220,
                  g: 237,
                  b: 249,
                  radius: 20,
                  buttonWeight: 70,
                  buttonHeight: 70,
                  screenName: 'DoctorScreen',
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DoctorsScreen())),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, top: 20),
                child: IconButton2(
                    urlImage: 'assets/images/medicine_icon.png',
                    r: 250,
                    g: 240,
                    b: 219,
                    radius: 20,
                    buttonWeight: 70,
                    buttonHeight: 70,
                    screenName: 'DoctorScreen'),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, top: 20),
                child: IconButton2(
                    urlImage: 'assets/images/health_check_icon.png',
                    r: 214,
                    g: 246,
                    b: 255,
                    radius: 20,
                    buttonWeight: 70,
                    buttonHeight: 70,
                    screenName: 'DoctorScreen'),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, top: 20),
                child: IconButton2(
                    urlImage: 'assets/images/virus_icon.png',
                    r: 242,
                    g: 227,
                    b: 233,
                    radius: 20,
                    buttonWeight: 70,
                    buttonHeight: 70,
                    screenName: 'DoctorScreen'),
              ),
            ]),
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Container(
                  width: 320,
                  height: 170,
                  child: Row(children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 28, top: 30),
                          child: TitleText1(
                              text: 'Đem lại dịch vụ',
                              fontFamily: 'Nunito Sans',
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              r: 37,
                              g: 49,
                              b: 65),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 28, top: 5),
                          child: TitleText1(
                              text: 'Y tế tốt nhất',
                              fontFamily: 'Nunito Sans',
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              r: 37,
                              g: 49,
                              b: 65),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 28, top: 10),
                          child: TitleText1(
                            text: 'Khách hàng là thượng đế',
                            fontFamily: 'Nunito Sans',
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            r: 103,
                            g: 112,
                            b: 118,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 9, top: 20),
                      child: AvatarWidget(
                          height: 150,
                          width: 125,
                          urlImage: 'assets/images/woman_doctor.png',
                          radius: 18),
                    ),
                  ]),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 220, 237, 249),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40, top: 20),
              child: TitleText1(
                text: 'Các cuộc hẹn sắp tới',
                fontFamily: 'Nunito Sans',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                r: 14,
                g: 16,
                b: 18,
              ),
            ),
            Container(
              height: 125,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(left: 35, top: 20),
                      child: Appointment(
                          day1: '12',
                          day2: 'T3',
                          time: '09:30 AM',
                          doctorName: 'Dr. Mim Akhter',
                          faculty: 'Bác sĩ tâm lý',
                          smallBox: Color.fromARGB(54, 113, 165, 255),
                          bigBox: Color.fromARGB(220, 28, 107, 164),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, right:35, top: 20),
                      child: Appointment(
                        day1: '15',
                        day2: 'T4',
                        time: '07:30 PM',
                        doctorName: 'Dr. Shahin Alam',
                        faculty: 'Bác sĩ tim mạch',
                        smallBox: Color.fromARGB(255, 224, 159, 31),
                        bigBox: Color.fromARGB(255, 251, 222, 224),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
