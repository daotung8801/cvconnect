import 'package:flutter/material.dart';
import '../components/ButtonText.dart';
import '../components/SmallHeaderWidget.dart';
import '../components/InputText1.dart';
import '../components/TitleText1.dart';

class AddHealthRecord extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:  SmallHeaderWidget(text: 'Tổng quan sức khỏe', icon: Icon(Icons.arrow_back_sharp)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 40),
            child: InputText1(hintText: 'Đường huyết', labelText: 'Đường huyết', maxLines: 1),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 40),
            child: InputText1(hintText: 'SPO2', labelText: 'SPO2', maxLines: 1),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 40),
            child: InputText1(hintText: 'Huyết áp', labelText: 'Huyết áp', maxLines: 1),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 40),
            child: InputText1(hintText: 'Nhịp tim', labelText: 'Nhịp tim', maxLines: 1),
          ),
          Padding(
            padding: EdgeInsets.only(left: 50, right: 50, top: 100),
            child: ButtonText(text: 'Thêm', r: 28, g: 107, b: 164, radius: 30, weight: 0, height: 51, screenName: 'ContactScreen'),
          ),
        ],
      ),
    );
  }
}