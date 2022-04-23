import 'package:flutter/material.dart';

class InputText1 extends StatelessWidget {
  InputText1(
      {Key? key,
      required this.hintText,
      required this.labelText,
      required this.maxLines})
      : super(key: key);

  String hintText, labelText;
  int maxLines;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextField(
      decoration: InputDecoration(
        hintText: this.hintText,
        labelText: this.labelText,
        labelStyle: TextStyle(
          fontSize: 18,
          fontFamily: 'Inter',
          color: Colors.black,
        ),
        hintStyle: TextStyle(
          fontSize: 18,
          fontFamily: 'Inter',
          color: Color.fromARGB(255, 189, 189, 189),
        ),
        border: OutlineInputBorder(),
        enabledBorder: const OutlineInputBorder(
          borderSide: const BorderSide(
              color: Color.fromARGB(255, 189, 189, 189), width: 1.0),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: const BorderSide(
              color: Color.fromARGB(220, 28, 107, 164), width: 2.0),
        ),
        fillColor: Color.fromARGB(255, 232, 232, 232),
        filled: true,
      ),
      maxLines: this.maxLines,
    );
  }
}
