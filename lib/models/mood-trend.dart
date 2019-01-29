import 'package:flutter/material.dart';

class MoodTrend {
  DateTime dailyMoodDate;
  String dailyMoodDescription;
  String dailyMoodIcon;
  String dailyMoodLabel;
  String dailyMoodTitle;

  MoodTrend(
    @required this.dailyMoodDate,
    @required this.dailyMoodDescription,
    @required this.dailyMoodIcon,
    @required this.dailyMoodLabel,
    @required this.dailyMoodTitle,
  );

  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
