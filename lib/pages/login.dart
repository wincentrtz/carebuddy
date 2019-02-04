import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  Function setUserAccount;

  LoginPage(this.setUserAccount);
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  @override
  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();
  Map<String, dynamic> _loginTempData = {
    'email': null,
    'password': null,
  };

  @override
  void initState() {
    super.initState();
  }

  void _doLogin() async {
    SharedPreferences datePref = await SharedPreferences.getInstance();
    String dateCheck = datePref.getString('date');
    DateTime today;
    DateTime check;
    var response = await http.post(
      'https://www.googleapis.com/identitytoolkit/v3/relyingparty/verifyPassword?key=AIzaSyArBu7wlB07jsIYDMn8qPR8kVCMujzMqUw',
      body: json.encode(
        {
          'email': _loginTempData['email'],
          'password': _loginTempData['password'],
          'returnSecureToken': true,
        },
      ),
    );

    if (response.statusCode == 200) {
      SharedPreferences userPref = await SharedPreferences.getInstance();
      final Map<String, dynamic> userData = json.decode(response.body);

      userPref.setString('tokenId', userData['idToken'].toString());
      userPref.setString('userId', userData['localId'].toString());

      var responseUserData = await http.get(
          'https://care-buddy-793cb.firebaseio.com/' +
              userData['localId'] +
              '/.json');
      final Map<String, dynamic> usersData = json.decode(responseUserData.body);

      String userUniqueId;
      usersData.forEach((String randomId, dynamic userData) {
        userUniqueId = randomId;
      });
      widget.setUserAccount(usersData, userUniqueId);

      if (dateCheck != null) {
        check = DateTime.parse(dateCheck);
        today = DateTime.now();
      }

      if (dateCheck != null && check.difference(today).inDays == 0) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        Navigator.pushReplacementNamed(context, '/daily-mood');
      }
    }
  }

  Widget build(BuildContext context) {
    final double deviceHeigth = MediaQuery.of(context).size.height;
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(top: deviceHeigth * 0.30),
                  height: deviceHeigth * 0.20,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'SIGN IN',
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF267EA0),
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                        child: new Center(
                          child: new Container(
                            margin: EdgeInsets.symmetric(horizontal: 128.0),
                            height: 2.0,
                            color: Color(0xFF267EA0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'A good caregiver is a',
                      ),
                      Text(
                        'Healthy Caregiver',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Color(0xFF267EA0),
                        ),
                      )
                    ],
                  )),
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment(0.8,
                          0.0), // 10% of the width, so there are ten blinds.
                      colors: [
                        Color(0xFF267EA0),
                        Color(0xFF25263b)
                      ], // whitish to gray
                      tileMode: TileMode
                          .clamp, // repeats the gradient over the canvas
                    ),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0))),
                height: deviceHeigth * 0.5,
                padding: EdgeInsets.symmetric(horizontal: 48.0),
                child: Form(
                  key: _loginKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 50.0,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(30.0),
                            ),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding: EdgeInsets.all(15.0),
                          hintText: "Email",
                        ),
                        onSaved: (String value) {
                          _loginTempData['email'] = value;
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(30.0),
                            ),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding: EdgeInsets.all(15.0),
                          hintText: "Password",
                        ),
                        onSaved: (String value) {
                          _loginTempData['password'] = value;
                        },
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          color: Color(0xFF267EA0),
                          textColor: Colors.white,
                          onPressed: () {
                            _loginKey.currentState.save();
                            _doLogin();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Next'),
                              Icon(Icons.keyboard_arrow_right),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        'Donʼt have an account yet?',
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, '/register'),
                        child: Text(
                          'Create an account',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
