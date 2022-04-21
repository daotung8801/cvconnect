import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 16);

  final String name;
  final String urlImage;

  const UserScreen({Key? key, required this.name, required this.urlImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(name),
        centerTitle: true,
      ),
      body: Material(
          child: Container(
              padding: padding.add(const EdgeInsets.symmetric(vertical: 16)),
              child: Column(children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(urlImage),
                  ),
                ),
              ]))));
}
