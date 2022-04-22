import 'package:flutter/material.dart';
import 'TitleText1.dart';

class SearchBar extends StatelessWidget {
  SearchBar(
      {Key? key,
        required this.text})
      : super(key: key);

  String text;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 314,
      height: 60,
      child: GestureDetector(
        onTap: () {},
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20, top: 5),
              child: Icon(Icons.search,
                  size: 25,
                  color: Color.fromARGB(255, 189, 189, 189)),
            ),
            Padding(
              padding: EdgeInsets.only(left: 5, top: 5),
              child: TitleText1(
                text: this.text,
                fontFamily: 'Nunito Sans',
                fontSize: 14,
                fontWeight: FontWeight.normal,
                r: 189,
                g: 189,
                b: 189,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 110, top: 5),
              child: Icon(Icons.tune,
                  size: 25, color: Color.fromARGB(255, 14, 16, 18)),
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color.fromARGB(255, 238, 246, 255),
      ),
    );
  }
}
