import 'package:flutter/material.dart';

class AccountSettingsScreen extends StatelessWidget {
  AccountSettingsScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(title),
        ),
      );
}
