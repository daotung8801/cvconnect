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
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    PatientSeries(
        month: 2,
        patients: 90,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    PatientSeries(
        month: 3,
        patients: 80,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    PatientSeries(
        month: 4,
        patients: 85,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    PatientSeries(
        month: 5,
        patients: 75,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            SmallHeaderWidget(text: 'Biểu đồ', icon: Icon(Icons.arrow_back)),
        body: Center(
          child: PatientChart(data: data),
        ));
  }
}
