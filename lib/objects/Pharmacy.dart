import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cvconnect/components/ButtonWidget.dart';
import 'package:cvconnect/components/ImageItemWidget.dart';
import 'package:cvconnect/mainReal=)).dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../components/TitleText1.dart';

class Pharmacy {
  final String name;
  final String? description;
  final double ratingStar;
  final int? numOfReview;
  final String image;
  final GeoPoint location;
  static final columns = [
    "name",
    "description",
    "ratingStar",
    "image",
    "location"
  ];

  Pharmacy(this.name, this.description, this.ratingStar, this.image,
      this.numOfReview, this.location);

  factory Pharmacy.fromMap(Map<dynamic, dynamic> data) {
    return Pharmacy(
      data['name'],
      data['description'],
      data['ratingStar'],
      data['image'],
      data['numOfReview'],
      data['location'],
    );
  }

  Map<String, dynamic> toMap() => {
        "name": name,
        "description": description,
        "ratingStar": ratingStar,
        "image": image,
        "numOfReview": numOfReview,
        "location": location,
      };

}

class PharmacyBoxList extends StatelessWidget {
  final List<Pharmacy> items;

  PharmacyBoxList({Key? key, required this.items});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.only(left: 20),
              height: 190,
              child: this._buildWidgetList()),
          Padding(
            padding: EdgeInsets.only(top: 50, bottom: 2),
            child: Text(
              "Đăng tải đơn thuốc",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Text("Chúng tôi sẽ gợi ý tất cả các nhà thuốc hợp lệ",
              style: TextStyle(fontSize: 18)),
          _shareAndUpload(),
          ButtonWidget(text: "Tiếp tục", onClicked: () {}),
          Padding(padding: EdgeInsets.only(bottom: 20))
        ],
      ),
    );
  }

  ListView _buildWidgetList() {
    return ListView.builder(
      itemCount: items.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
            padding: EdgeInsets.only(left: 10),
            child: InkWell(
              child: ImageItemWidget(item: items[index]),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PharmacyPage(item: items[index]),
                  ),
                );
              },
            ));
      },
    );
  }

  Widget _shareAndUpload() {
    return Padding(
        padding: EdgeInsets.all(30),
        child: Container(
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
                color: Color.fromRGBO(232, 236, 244, 1),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                spreadRadius: 1,
                                blurRadius: 4,
                                offset:
                                    Offset(0, 0), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.circular(20)),
                        child: Icon(
                          Icons.attachment_rounded,
                          color: Colors.blue,
                          size: 33,
                        ),
                        height: 80,
                        width: 80,
                      ),
                      Padding(padding: EdgeInsets.only(top: 8)),
                      Text("Chia sẻ")
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                spreadRadius: 1,
                                blurRadius: 4,
                                offset:
                                    Offset(0, 0), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.circular(20)),
                        child: Icon(
                          Icons.upload_file,
                          color: Color.fromRGBO(232, 152, 28, 1),
                          size: 33,
                        ),
                        height: 80,
                        width: 80,
                      ),
                      Padding(padding: EdgeInsets.only(top: 8)),
                      Text("Tải lên")
                    ],
                  ),
                ])));
  }
}

class PharmacyBox {}

class PharmacyPage extends StatelessWidget {
  PharmacyPage({Key? key, required this.item}) : super(key: key);
  final Pharmacy item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://www.woolha.com/media/2020/03/eevee.png'),
                  radius: 30,
                ),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(item.name,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(item.description.toString()),
                            Text(
                                "Đánh giá: " + this.item.ratingStar.toString()),
                            Text("(" +
                                this.item.numOfReview.toString() +
                                "nhận xét)"),
                          ],
                        )))
              ]),
        ),
      ),
    );
  }
}
