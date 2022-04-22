import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  final void Function() onPressed;
  const BackButtonWidget({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /* return Container(
      width: 44,
      height: 44,
      child: const Center(
        child: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(16)),
        border: Border.all(color: Colors.black),
      ),
    ); */

    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
    child: Icon(
      Icons.arrow_back,
      color: Colors.black,
    ),
    );
  }
}
