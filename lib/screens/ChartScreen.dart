import 'package:charts_flutter/flutter.dart' as charts;
import 'package:cvconnect/components/SmallHeaderWidget.dart';
import 'package:cvconnect/objects/PatientChart.dart';
import 'package:cvconnect/objects/PatientSeries.dart';
import 'package:flutter/material.dart';

class ChartScreen extends StatelessWidget {
  ChartScreen({Key? key}) : super(key: key);
  final List<PatientSeries> data = [
    PatientSeries(
        month: 1,
        patients: 100,
        barColor: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 28, 107, 164))),
    PatientSeries(
        month: 2,
        patients: 90,
        barColor: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 28, 107, 164))),
    PatientSeries(
        month: 3,
        patients: 80,
        barColor: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 28, 107, 164))),
    PatientSeries(
        month: 4,
        patients: 85,
        barColor: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 28, 107, 164))),
    PatientSeries(
        month: 5,
        patients: 75,
        barColor: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 28, 107, 164))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            SmallHeaderWidget(text: 'Biểu đồ', icon: Icon(Icons.arrow_back)),
        body: Center(
          child: Padding(
            padding: EdgeInsets.only(left: 15, top: 200, bottom: 200),
            child: PatientChart(data: data),
          )
        ));
  }
}
