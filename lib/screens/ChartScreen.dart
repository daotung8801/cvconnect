import 'package:charts_flutter/flutter.dart' as charts;
import 'package:cvconnect/objects/PatientChart.dart';
import 'package:cvconnect/objects/PatientSeries.dart';
import 'package:flutter/material.dart';

class ChartScreen extends StatelessWidget {
  ChartScreen({Key? key}) : super(key: key);
  final List<PatientSeries> data = [
    PatientSeries(
        month: 1,
        patients: 1000,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    PatientSeries(
        month: 2,
        patients: 1000,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    PatientSeries(
        month: 3,
        patients: 1000,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        body: Center(
      child: PatientChart(data: data),
    ));
  }
}
