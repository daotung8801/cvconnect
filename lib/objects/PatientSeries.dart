import 'package:charts_flutter/flutter.dart' as charts;

class PatientSeries {
  final int month;
  final int patients;
  final charts.Color barColor;

  PatientSeries(
      {required this.month, required this.patients, required this.barColor});
}
