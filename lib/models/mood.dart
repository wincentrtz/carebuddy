import 'package:flutter/material.dart';

class Mood {
  final String moodLabel;
  final String moodImageUrl;
  final String moodColorTheme;

  Mood({
    @required this.moodLabel,
    @required this.moodImageUrl,
    @required this.moodColorTheme,
  });

  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
