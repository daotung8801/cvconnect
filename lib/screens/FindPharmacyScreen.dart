import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../mainReal=)).dart';

class FindPharmacyScreen extends StatelessWidget {
  final List<String> drugs;

  const FindPharmacyScreen({Key? key, required this.drugs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ApplicationState(),
        builder: (context, _) =>
            Consumer<ApplicationState>(builder: (context, locationState, _) {
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.blue,
                  title: Text('Hehehe'),
                ),
              );
            }));
  }
}
