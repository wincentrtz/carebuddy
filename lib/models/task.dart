import 'package:flutter/material.dart';

class Task {
  String id;
  String taskTitle;
  String taskColorTheme;

  int generateColorFromString(String color) {
    String valueString = color.split('(0x')[1].split(')')[0];
    int value = int.parse(valueString, radix: 16);
    return value;
  }
}
