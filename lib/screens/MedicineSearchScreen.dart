import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cvconnect/components/BigHeaderWidget.dart';
import 'package:cvconnect/components/SmallHeaderWidget.dart';
import 'package:cvconnect/main.dart';
import 'package:cvconnect/objects/Pharmacy.dart';
import 'package:flutter/material.dart';

class MedicineSearchScreen extends StatelessWidget {
  final String address;
  MedicineSearchScreen({Key? key, required this.address}) : super(key: key);
  CollectionReference pharmacy =
      FirebaseFirestore.instance.collection('pharmacy');
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
          stream: fetchProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            if (snapshot.hasData) {
              print('check ok');
              List<DocumentSnapshot> documents = snapshot.data!.docs;
              List<Pharmacy> items = <Pharmacy>[];
              for (var i = 0; i < documents.length; i++) {
                //print(documents[i].data().toString());
                DocumentSnapshot document = documents[i];
                items.add(
                    Pharmacy.fromMap(document.data() as Map<dynamic, dynamic>));
                print(items.first);
              }
              return PharmacyBoxList(items: items);
            } else {
              print('no data');
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ));
}
