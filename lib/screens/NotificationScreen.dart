import 'package:cvconnect/screens/ChatScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/TitleText1.dart';
import 'ChartScreen.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Padding(
            padding: EdgeInsets.only(left: 28, top: 25),
            child: TitleText1(
                text: 'Thông báo',
                fontFamily: 'Nunito Sans',
                fontSize: 27,
                fontWeight: FontWeight.bold,
                r: 37,
                g: 49,
                b: 65),
          ),
        ),
        body: SafeArea(
            minimum:
                const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 10),
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                  GestureDetector(
                    child: index(
                      "Lịch trình",
                      "Kiểm tra lịch trình hôm nay",
                      Icon(
                        Icons.calendar_today_rounded,
                        color: Color.fromARGB(255, 28, 107, 164),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChatScreen()));
                    },
                    child: index(
                      "Tin nhắn",
                      "Kiểm tra lịch trình hôm nay",
                      Icon(Icons.message_outlined,
                          color: Color.fromRGBO(248, 56, 88, 1)),
                    ),
                  ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChartScreen()));
                        },
                        child: index(
                          "Thống kê",
                          "Kiểm tra lịch trình hôm nay",
                          Icon(Icons.bar_chart,
                              color: Colors.lightGreen),
                        ),
                      ),
                  index(
                    "Thuốc",
                    "Kiểm tra lịch trình hôm nay",
                    Icon(
                      Icons.local_hospital_outlined,
                      color: Color.fromRGBO(232, 152, 28, 1),
                    ),
                  ),
                  index(
                    "Cập nhật tình trạng vắc xin",
                    "Kiểm tra lịch trình hôm nay",
                    Icon(
                      Icons.vaccines,
                      color: Color.fromRGBO(4, 152, 200, 1),
                    ),
                  ),
                  index(
                    "Cập nhật ứng dụng",
                    "Kiểm tra lịch trình hôm nay",
                    Icon(
                      Icons.history,
                      color: Color.fromARGB(255, 157, 76, 108),
                    ),
                  )
                ]))),
      );

  Widget index(String title, String subtitle, Icon icon) {
    Color? backgroundIcon = icon.color?.withOpacity(0.3);
    return Container(
        height: 100,
        alignment: Alignment.center,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: Colors.transparent,
          elevation: 0,
          child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black45),
                  borderRadius: BorderRadius.circular(20)),
              child: ListTile(
                leading: SizedBox(
                  child: DecoratedBox(
                    child: icon,
                    decoration: BoxDecoration(
                        color: backgroundIcon,
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  width: 50,
                  height: 50,
                ),
                title: Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black),
                ),
                subtitle: Text(subtitle,
                    style: TextStyle(fontSize: 15, color: Colors.black45)),
              )),
        ));
  }
}
