import 'package:flutter/material.dart';
import '../components/TitleText1.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
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
          backgroundColor: Colors.transparent,
          toolbarHeight: 130,
          elevation: 0.0,
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 30),
              child: Container(
                height: 60.0,
                width: 60.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/header_icon.png'),
                    fit: BoxFit.contain,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                ),
              ),
            ),
          ],
        ),
        body: ListView(
          children: <Widget>[
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 5),
                child: Container(
                  width: 350,
                  height: 60,
                  child: GestureDetector(
                    onTap: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20, top: 5),
                          child: Icon(Icons.search, size: 30, color: Color.fromARGB(255, 189, 189, 189)),
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
                          padding: EdgeInsets.only(left: 130, top: 5),
                          child: Icon(Icons.tune, size: 30, color: Color.fromARGB(255, 14, 16, 18)),
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
         ],
        ),
  );
}
