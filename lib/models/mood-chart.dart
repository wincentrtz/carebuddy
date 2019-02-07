import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class MoodChart {
  final int moodLabel;
  final String date;
  final charts.Color color;

  MoodChart(this.moodLabel, this.date, Color color)
      : this.color = new charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}
