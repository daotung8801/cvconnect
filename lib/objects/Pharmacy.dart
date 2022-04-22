import 'package:cvconnect/components/ImageItemWidget.dart';
import 'package:flutter/material.dart';

class Pharmacy {
  final int? id;
  final String name;
  final String? description;
  final double? ratingStar;
  final int? numOfReview;
  final String image;
  static final columns = ["id", "name", "description", "ratingStar", "image"];

  Pharmacy(this.id, this.name, this.description, this.ratingStar, this.image,
      this.numOfReview);

  factory Pharmacy.fromMap(Map<dynamic, dynamic> data) {
    return Pharmacy(
      data['id'],
      data['name'],
      data['description'],
      data['ratingStar'],
      data['image'],
      data['numOfReview'],
    );
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "description": description,
        "ratingStar": ratingStar,
        "image": image,
        "numOfReview": numOfReview,
      };
}

class PharmacyBoxList extends StatelessWidget {
  final List<Pharmacy> items;

  PharmacyBoxList({Key? key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: ImageItemWidget(item: items[index]),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PharmacyPage(item: items[index]),
              ),
            );
          },
        );
      },
    );
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
        title: Text(this.item.name),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset("assets/appimages/" + this.item.image),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(this.item.name,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(this.item.description.toString()),
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
