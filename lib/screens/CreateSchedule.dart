import 'package:cvconnect/components/ButtonText.dart';
import 'package:cvconnect/components/DateBar.dart';
import 'package:cvconnect/components/InputTextField.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../components/TitleText1.dart';

class CreateSchedule extends StatefulWidget {
  @override
  CreateScheduleState createState() => CreateScheduleState();
}

class CreateScheduleState extends State<CreateSchedule> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay startTime = TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);

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
    });
  }

  String getTimeStringFormat() {
    return '${startTime.hour}:${startTime.minute}';
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Padding(
            padding: EdgeInsets.only(left: 10),
            child: TitleText1(
                text: 'Đặt lịch mới',
                fontFamily: 'Nunito Sans',
                fontSize: 27,
                fontWeight: FontWeight.bold,
                r: 37,
                g: 49,
                b: 65),
          ),
          leading: IconButton(
            color: Colors.black,
            padding: EdgeInsets.only(left: 35),
            iconSize: 30,
            alignment: Alignment.center,
            icon: Icon(Icons.arrow_back_sharp),
            onPressed: () => {
              Navigator.pop(context),
            },
          ),
          backgroundColor: Colors.transparent,
          toolbarHeight: 80,
          elevation: 0.0,
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 35, right: 35, top: 30),
              child: InputTextField(
                  hintText: 'Nhập tên bác sĩ',
                  labelText: 'Tên bác sĩ',
                  widget: null),
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
            Padding(
              padding: EdgeInsets.only(left: 35, right: 35, top: 70),
              child: ButtonText(text: 'Đặt', r: 28, g: 107, b: 164, radius: 30, weight: 343, height: 51, screenName: 'CreateSchedule'),
            ),
          ],
        ),
      );
}
