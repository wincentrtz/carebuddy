import 'package:flutter/material.dart';
import '../models/task-detail.dart';

class Task {
  String id;
  String taskTitle;
  String taskColorTheme;
  Map<String, List<TaskDetail>> taskDetails;

  int generateColorFromString(String color) {
    String valueString = color.split('(0x')[1].split(')')[0];
    int value = int.parse(valueString, radix: 16);
    return value;
  }
}
