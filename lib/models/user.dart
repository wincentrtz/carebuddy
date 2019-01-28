import 'package:flutter/material.dart';

class User {
  String id;
  String userName;
  String userGender;
  String userDOB;
  String userPhone;

  User(@required this.id, @required this.userName, @required this.userGender,
      @required this.userDOB, @required this.userPhone);
}
