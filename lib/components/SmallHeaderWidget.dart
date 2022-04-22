import 'package:cvconnect/components/BackButtonWidget.dart';
import 'package:cvconnect/components/TitleText1.dart';
import 'package:flutter/material.dart';

class SmallHeaderWidget extends StatelessWidget with PreferredSizeWidget {
  final String text;
  final Icon? icon;

  const SmallHeaderWidget({Key? key, required this.text, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: const BackButtonWidget(),
      leadingWidth: 72,
      centerTitle: true,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon!,
          TitleText1(
              text: text,
              fontFamily: 'Nunito Sans',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              r: 0,
              g: 0,
              b: 0)
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);
}
