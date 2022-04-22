import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cvconnect/components/BigHeaderWidget.dart';
import 'package:cvconnect/components/SmallHeaderWidget.dart';
import 'package:cvconnect/main.dart';
import 'package:cvconnect/objects/Pharmacy.dart';
import 'package:flutter/material.dart';

class MedicineSearchScreen extends StatelessWidget {
  final String address;
  const MedicineSearchScreen({Key? key, required this.address})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: SmallHeaderWidget(
          text: address,
          icon: const Icon(
            Icons.location_on,
            color: Colors.black,
          ),
        ),
      body: Center(
        child: StreamBuilder<QuerySnapshot>(
          stream: fetchProducts(), builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          if(snapshot.hasData) {
            print('check ok');
            Pharmacy item = Pharmacy(123, "Long Chau", "description", 5.0, 'assets/images/doctor_icon.png', 5);
            List<Pharmacy> items = <Pharmacy>[];
            items.add(item);
            return PharmacyBoxList(items: items);
          } else {
            print('no data');
            return const Center(child: CircularProgressIndicator());
          }
        },
        ),
      )
      );
}
