import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cvconnect/components/BigHeaderWidget.dart';
import 'package:cvconnect/components/SmallHeaderWidget.dart';
import 'package:cvconnect/main.dart';
import 'package:cvconnect/objects/Pharmacy.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:scoped_model/scoped_model.dart';

import '../mainReal=)).dart';

class MedicineSearchScreen extends StatelessWidget {
  const MedicineSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ApplicationState(),
      builder: (context, _) => Consumer<ApplicationState>(builder: (context, locationState, _) {
              return Scaffold(
                  appBar: SmallHeaderWidget(
                    text:
                        '${locationState.placemark?.subAdministrativeArea}, ${locationState.placemark?.administrativeArea}',
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
                          Pharmacy item = Pharmacy(
                              123,
                              "Long Chau",
                              "description",
                              5.0,
                              'assets/images/doctor_icon.png',
                              5);
                          List<Pharmacy> items = <Pharmacy>[];
                          items.add(item);
                          // List<DocumentSnapshot>documents = snapshot.data!.docs;
                          // for(var i = 0; i < documents.length; i++) {
                          //   DocumentSnapshot document = documents[i];
                          //   items.add(Pharmacy.fromMap(document.data() as Map<dynamic, dynamic>));
                          //   print(items.length);
                          // }
                          return PharmacyBoxList(items: items);
                        } else {
                          print('no data');
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                    ),
                  ));
            }));
  }
}