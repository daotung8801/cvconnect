import 'package:cvconnect/components/BigHeaderWidget.dart';
import 'package:cvconnect/components/SmallHeaderWidget.dart';
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
      );
}
