import 'package:charts_flutter/flutter.dart' as charts;

class ColumnChartModel {
  String time;
  int money;
  final charts.Color color;

  ColumnChartModel({
    required this.time,
    required this.money,
    required this.color,
  });
}