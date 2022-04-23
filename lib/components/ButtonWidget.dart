import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final IconData? icon;
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    this.icon,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (icon != null)
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(100),
          primary: Colors.transparent,
          elevation: 0
        ),
        child: buildContent(),
        onPressed: onClicked,
      );
    else
      return GestureDetector(
        child: Center(
          child: Container(
            width: 300,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Color.fromRGBO(32,108,164, 1),
                borderRadius: BorderRadius.circular(8)),
            child: Text(
              "Tiếp tục",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
        onTap: onClicked,
      );
  }

  Widget buildContent() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 28),
        SizedBox(width: 16),
        Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
              fontSize: 17,
              color: Colors.white),
        ),
      ],
    );
  }
}
