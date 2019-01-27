import 'package:flutter/material.dart';

class User {
  final String userName;
  final String userPassword;
  final String userEmail;
  final String userGender;
  final String userDOB;
  final String userPhone;
  final int moodIndex;

  User(
      @required this.userName,
      @required this.userPassword,
      @required this.userEmail,
      @required this.userGender,
      @required this.userDOB,
      @required this.userPhone,
      {this.moodIndex});
}
