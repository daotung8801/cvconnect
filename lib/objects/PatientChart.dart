import 'package:cvconnect/objects/PatientSeries.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';

class PatientChart extends StatelessWidget {
  final List<PatientSeries> data;

  const PatientChart({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<charts.Series<PatientSeries, String>> series = [
      charts.Series(
          id: "Patient",
          data: data,
          domainFn: (PatientSeries series, _) => series.month,
          measureFn: (PatientSeries series, _) => series.patients,
          colorFn: (PatientSeries series, _) => series.barColor)
    ];
    return charts.BarChart(
      series,
      animate: true,
    );
  }
}
