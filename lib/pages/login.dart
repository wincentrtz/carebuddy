import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  @override
  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();

  Widget _buildEmailTextField() {}

  Widget build(BuildContext context) {
    // TODO: implement build
    final double deviceWidth = MediaQuery.of(context).size.width;
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
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextField(
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
                            Navigator.pushReplacementNamed(
                                context, '/daily-mood');
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
                      Text(
                        'Create an account',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500),
                      )
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
