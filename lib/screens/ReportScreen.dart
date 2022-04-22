import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/TitleText1.dart';

class ReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
            title: Padding(
              padding: EdgeInsets.only(left: 28, top: 25),
              child: TitleText1(
                  text: 'Hồ sơ',
                  fontFamily: 'Nunito Sans',
                  fontSize: 28,
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
                children: [heartBeat(), bloodGroup(), _report()],
              ),
            )),
      );

  Widget heartBeat() {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: <
        Widget>[
      Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: Color.fromRGBO(224, 236, 252, 1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(padding: EdgeInsets.all(10)),
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(bottom: 10)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Nhịp tim",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "96",
                          style: TextStyle(fontSize: 50, color: Colors.black),
                        ),
                        Text(
                          "/phút",
                          style: TextStyle(fontSize: 25, color: Colors.black),
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 10))
                  ]),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Icon(
                    Icons.monitor_heart_outlined,
                    size: 150,
                    color: Color.fromRGBO(32, 108, 164, 1),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                  ),
                ],
              ))
            ],
          ))
    ]);
  }

  Widget bloodGroup() {
    return Column(
      children: <Widget>[
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                  child: SizedBox(
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: Color.fromRGBO(248, 228, 236, 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(padding: EdgeInsets.all(10)),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(top: 10),
                              ),
                              Icon(
                                Icons.bloodtype,
                                size: 40,
                                color: Color.fromARGB(255, 157, 76, 108),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10),
                              ),
                              Text(
                                "Nhóm máu",
                                style: TextStyle(
                                    fontSize: 13, color: Colors.black),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10),
                              ),
                              Text(
                                "A+",
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 10))
                            ]),
                      ],
                    )),
                height: 130,
              )),
              Padding(padding: EdgeInsets.only(left: 10)),
              Expanded(
                  child: SizedBox(
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: Color.fromRGBO(248, 248, 212, 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(padding: EdgeInsets.all(10)),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(top: 10),
                              ),
                              Icon(
                                Icons.scale,
                                size: 40,
                                color: Color.fromRGBO(232, 152, 28, 1),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10),
                              ),
                              Text(
                                "Cân nặng",
                                style: TextStyle(
                                    fontSize: 13, color: Colors.black),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "80",
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    " kg",
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 10))
                            ]),
                      ],
                    )),
                height: 130,
              )),
            ],
          ),
        )
      ],
    );
  }

  Widget _report() {
    return Column(
      children: [
        Padding(padding: EdgeInsets.only(top: 25)),
        Container(
          alignment: Alignment.bottomLeft,
          child: Text(
            "Báo cáo mới nhất",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Container(height: 500, child: lastestReport())
      ],
    );
  }

  ListView lastestReport() {
    return ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return indexReport("Tổng quan sức khỏe", "8 tệp", index);
        });
  }

  Widget indexReport(String title, String subtitle, int _int_color) {
    //2 colors
    Color? _color = Color.fromRGBO(8, 140, 92, 1);
    if (_int_color == 0) _color = Color.fromRGBO(32, 108, 164, 1);

    return Container(
        height: 90,
        alignment: Alignment.center,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: Colors.transparent,
          elevation: 0,
          child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26),
                  borderRadius: BorderRadius.circular(20)),
              child: ListTile(
                leading: SizedBox(
                  child: DecoratedBox(
                    child: Icon(
                      Icons.library_books_sharp,
                      color: _color,
                    ),
                    decoration: BoxDecoration(
                        color: _color.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  width: 52,
                  height: 52,
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
                onTap: () {},
              )),
        ));
  }
}
