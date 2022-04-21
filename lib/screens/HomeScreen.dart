import 'package:cvconnect/components/BigHeaderWidget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
        appBar: BigHeaderWidget(
          text: 'Trang chủ',
        ),
      );
}
