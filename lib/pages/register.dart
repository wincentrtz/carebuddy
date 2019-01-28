import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  Function setUserAccount;

  RegisterPage(this.setUserAccount);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RegisterPageState();
  }
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  final TextEditingController _passwordTextController = TextEditingController();
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();

  Map<String, dynamic> _registerTempData = {
    'username': null,
    'gender': null,
    'email': null,
    'password': null,
    'dob': null,
    'phone': null,
  };

  Widget _buildRegisterTextFormField(String text, String hint, String type) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          text,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF267EA0),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          margin: EdgeInsets.only(left: 10.0),
          child: TextFormField(
            decoration: InputDecoration(
              border: new OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(30.0),
                ),
              ),
              fillColor: Color(0xFFc8eaf8),
              filled: true,
              contentPadding: EdgeInsets.all(15.0),
              hintText: hint,
            ),
            onSaved: (String value) {
              _registerTempData[type] = value;
            },
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  _doRegister() async {
    _showDialog();
    var response = await http.post(
      'https://www.googleapis.com/identitytoolkit/v3/relyingparty/signupNewUser?key=AIzaSyArBu7wlB07jsIYDMn8qPR8kVCMujzMqUw',
      body: json.encode(
        {
          'email': _registerTempData['email'],
          'password': _registerTempData['password'],
          'returnSecureToken': true,
        },
      ),
    );
    if (response.statusCode == 200) {
      SharedPreferences userPref = await SharedPreferences.getInstance();
      final Map<String, dynamic> userData = json.decode(response.body);

      userPref.setString('tokenId', userData['idToken'].toString());
      userPref.setString('userId', userData['localId'].toString());

      var responseUserData = await http.post(
        "https://care-buddy-793cb.firebaseio.com/" +
            userData['localId'] +
            ".json",
        body: json.encode(
          _registerTempData,
        ),
      );

      final Map<String, dynamic> responseUserDataDecode =
          json.decode(responseUserData.body);
      userPref.setString('userName', userData['username']);
      widget.setUserAccount(_registerTempData, responseUserDataDecode['name']);
      Navigator.of(context).pop();
      Navigator.pushReplacementNamed(context, '/home');
    } else {}
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          content: Text("Submitting Report..."),
          actions: <Widget>[],
        );
      },
    );
  }

  Widget _buildRegisterPasswordTextFormField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Password",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF267EA0),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          margin: EdgeInsets.only(left: 10.0),
          child: TextFormField(
            obscureText: true,
            controller: _passwordTextController,
            decoration: InputDecoration(
              border: new OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(30.0),
                ),
              ),
              fillColor: Color(0xFFc8eaf8),
              filled: true,
              contentPadding: EdgeInsets.all(15.0),
              hintText: "Password",
            ),
            onSaved: (String value) {
              _registerTempData['password'] = value;
            },
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget _buildRegisterConfirmPasswordTextFormField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Confirm Password",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF267EA0),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          margin: EdgeInsets.only(left: 10.0),
          child: TextFormField(
            obscureText: true,
            validator: (String value) {
              if (_passwordTextController.text != value) {
                return 'Confirm password does not match';
              }
            },
            decoration: InputDecoration(
              border: new OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(30.0),
                ),
              ),
              fillColor: Color(0xFFc8eaf8),
              filled: true,
              contentPadding: EdgeInsets.all(15.0),
              hintText: "Confirm Password",
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Form(
            key: _registerFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 40.0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.keyboard_arrow_left,
                    size: 60.0,
                    color: Color(0xFF267EA0),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: 44.0, bottom: 20.0, right: 44.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'CREATE AN ACCOUNT',
                        style: TextStyle(
                          fontSize: 36.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF267EA0),
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      _buildRegisterTextFormField(
                          'Name', 'Full Name', 'username'),
                      _buildRegisterTextFormField(
                          'Gender', 'Male / Female', 'gender'),
                      _buildRegisterTextFormField(
                          'Date of Birth', 'DD/MM/YYYY', 'dob'),
                      _buildRegisterTextFormField(
                          'Phone Number', '+62 xxxxxxxxxx', 'phone'),
                      _buildRegisterTextFormField(
                          'Email', 'example@example.com', 'email'),
                      _buildRegisterPasswordTextFormField(),
                      _buildRegisterConfirmPasswordTextFormField(),
                      Container(
                        margin: EdgeInsets.only(top: 20.0),
                        width: double.infinity,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          color: Color(0xFF267EA0),
                          textColor: Colors.white,
                          onPressed: () {
                            _registerFormKey.currentState.save();
                            _registerFormKey.currentState.validate();
                            _doRegister();
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
