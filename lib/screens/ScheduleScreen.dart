import 'dart:math';

import 'package:cvconnect/components/DateBar.dart';
import 'package:cvconnect/components/DoctorInfo.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../components/InputTextField.dart';
import '../components/TitleText1.dart';
import '../objects/Doctor.dart';
import '../objects/ScheduleIndex.dart';
import 'CreateSchedule.dart';

class ScheduleScreen extends StatefulWidget {
  @override
  ScheduleScreenState createState() => ScheduleScreenState();
}

class ScheduleScreenState extends State<ScheduleScreen> {
  List<Color> colors = [
    Color.fromARGB(210, 28, 107, 164),
    Color.fromARGB(220, 224, 159, 31),
    Color.fromARGB(150, 24, 255, 255)
  ];

  final problemController = TextEditingController();
  final passwordController = TextEditingController();
  List<IndexSchedule> listAccount = <IndexSchedule>[];
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String _problem = "";
  static DateTime selectedDate = DateTime.now();
  TimeOfDay startTime = TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);

  void saveSchedule() {
    listAccount.add(new IndexSchedule(problem: _problem, selectedDate: selectedDate, startTime: startTime));
    problemController.text = '';
    passwordController.text = '';
  }

  Future pickDate(BuildContext context) async {
    final newDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 2),
      builder: (context, child) => Theme(
        data: ThemeData.light().copyWith(
          colorScheme:
          ColorScheme.light(primary: Color.fromARGB(255, 28, 107, 164)),
        ),
        child: child as Widget,
      ),
    );
    if (newDate == null) return;
    setState(() {
      selectedDate = newDate;
      Navigator.of(context).pop();
      _onButtonShowModalSheet();
    });
  }

  Future pickTime(BuildContext context) async {
    final initialTime = TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);
    final newTime = await showTimePicker(
      context: context,
      initialTime: startTime ?? initialTime,

    );
    if (newTime == null) return;
    setState(() {
      startTime = newTime;
      Navigator.of(context).pop();
      _onButtonShowModalSheet();
    });
  }

  String getTimeStringFormat() {
    return '${startTime.hour}:${startTime.minute}';
  }

  void _onButtonShowModalSheet() {
    showModalBottomSheet(
        context: this.context,
        builder: (context) {
          return SingleChildScrollView(
            child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 35, right: 35, top: 30),
                child: TextField(
                    decoration: InputDecoration(labelText: "Vấn đề gặp phải"),
                    controller: problemController,
                    onChanged: (text) {
                      _problem = text;
                    },
                    ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 35, right: 35, top: 30),
                child: InputTextField(
                  hintText: DateFormat.yMd().format(selectedDate),
                  labelText: 'Chọn ngày',
                  widget: IconButton(
                    icon: Icon(Icons.calendar_today),
                    color: Color.fromARGB(255, 28, 107, 164),
                    onPressed: () {
                      pickDate(context);
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 35, right: 35, top: 30),
                child: InputTextField(
                  hintText: getTimeStringFormat(),
                  labelText: 'Chọn thời gian',
                  widget: IconButton(
                    icon: Icon(Icons.access_time_rounded),
                    color: Color.fromARGB(255, 28, 107, 164),
                    onPressed: () {
                      pickTime(context);
                    },
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                        child: SizedBox(
                      child: RaisedButton(
                          child: Text('Save'),
                          onPressed: () {
                            setState(() {
                              saveSchedule();
                            });
                            Navigator.of(context).pop();
                          }),
                      height: 50,
                    )),
                    Padding(padding: EdgeInsets.only(left: 10)),
                    Expanded(
                        child: SizedBox(
                      child: RaisedButton(
                          child: Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                      height: 50,
                    ))
                  ],
                ),
              )
            ],
            )
          );
        });
  }

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
        floatingActionButton: FloatingActionButton(
          tooltip: 'Add action',
          child: Icon(Icons.add),
          onPressed: () {
            this._onButtonShowModalSheet();
            _scaffoldKey.currentState?.showSnackBar(
              SnackBar(
                content: Text("Success"),
                duration: Duration(seconds: 3),
              ),
            );
          },
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DateBar(),
            ListSchedule(
              listSchedule: listAccount,
            )
          ],
        ),
      );

  Widget _scheduleIndex(
      String _time, String _name, String _avatar, String _role) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 30),
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
                urlImage: _avatar,
                imageSize: 70,
                time: _time,
                doctorName: _name,
                faculty: _role,
                bigBox: this.colors.elementAt(Random().nextInt(3))),
          ),
        ],
      ),
    );
  }

  Widget _elementDoctor() {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 35, right: 35),
      child: DoctorInfo(
          urlImage:
              'https://img.freepik.com/free-photo/pleased-young-female-doctor-wearing-medical-robe-stethoscope-around-neck-standing-with-closed-posture_409827-254.jpg?w=2000',
          imageSize: 70,
          time: '10:25 PM',
          doctorName: 'Đinh Thị Mai',
          faculty: 'Bác sĩ tim mạch',
          bigBox: Color.fromARGB(200, 233, 116, 159)),
    );
  }
}
