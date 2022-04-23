import 'dart:math';

import 'package:cvconnect/components/DoctorInfo.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
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

  static int dayPicked = 1;
  static int monthPicked = 1;
  final problemController = TextEditingController();
  List<IndexSchedule> listAccount = <IndexSchedule>[];
  String _problem = "";
  static DateTime selectedDate = DateTime.now();
  TimeOfDay startTime =
      TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);

  Widget DateBar() {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(left: 35),
      child: DatePicker(
        DateTime.now(),
        height: 84,
        width: 70,
        onDateChange: (val) {
          dayPicked = val.day;
          monthPicked = val.month;
          print('date changed');
          setState(() {});
        },
        initialSelectedDate: DateTime.now(),
        selectionColor: Color.fromARGB(255, 28, 107, 164),
        selectedTextColor: Colors.white,
        dateTextStyle: TextStyle(
          fontSize: 20,
          fontFamily: 'Nunito Sans',
          fontWeight: FontWeight.w600,
          color: Color.fromARGB(255, 37, 49, 65),
        ),
      ),
    );
  }

  void saveSchedule() {
    listAccount.add(new IndexSchedule(
        problem: _problem, selectedDate: selectedDate, startTime: startTime));
    problemController.text = '';
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
    final initialTime =
        TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);
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
        backgroundColor: Colors.transparent,
        context: this.context,
        builder: (context) {
          return Container(
              padding: EdgeInsets.only(left: 30, right: 30, bottom: 30),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(232, 236, 244, 1),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: SingleChildScrollView(
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
                    padding: EdgeInsets.only(
                        top: 50, left: 10, right: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                            child: SizedBox(
                          child: InkWell(
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(32, 108, 164, 1),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Text(
                                  "Đặt",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                              onTap: () {
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
                          child: InkWell(
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(32, 108, 164, 1),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Text(
                                  "Hủy",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).pop();
                              }),
                          height: 50,
                        ))
                      ],
                    ),
                  )
                ],
              )));
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
}
