import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import './task.dart';
import '../models/user.dart';

class HomePage extends StatefulWidget {
  User user;
  String moodUrl;
  Function setUserAccount;
  Function checkUser;

  HomePage(this.user, this.setUserAccount, this.checkUser);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  bool isLoading = true;
  void initState() {
    // TODO: implement initState
    if (widget.user == null) {
      setState(() {
        _getUserPreferences();
        isLoading = false;
      });
    }
    super.initState();
  }

  void _getUserPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString('userId');
    var responseUserData = await http
        .get('https://care-buddy-793cb.firebaseio.com/' + userId + '/.json');
    final Map<String, dynamic> usersData = json.decode(responseUserData.body);
    String userUniqueId;
    usersData.forEach((String randomId, dynamic userData) {
      userUniqueId = randomId;
    });
    widget.setUserAccount(usersData, userUniqueId);
  }

  @override
  Widget build(BuildContext context) {
    final double deviceHeigth = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 60.0),
        height: deviceHeigth,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment(0.8, 0.0),
            colors: [Color(0xFF25263b), Color(0xFF267EA0)],
            tileMode: TileMode.clamp,
          ),
        ),
        child: widget.user == null
            ? Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ],
                ),
              )
            : ListView(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 150,
                        child: Column(
                          children: <Widget>[
                            AutoSizeText(
                              'HELLO,',
                              style: TextStyle(
                                fontSize: 32,
                                color: Colors.white,
                              ),
                              maxLines: 1,
                            ),
                            AutoSizeText(
                              widget.user.userName.toUpperCase(),
                              style: TextStyle(
                                fontSize: 36,
                                color: Colors.white,
                              ),
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 40.0,
                      ),
                      Stack(
                        alignment: const Alignment(-1.2, 1.2),
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/support.png'),
                            radius: 40.0,
                            backgroundColor: Colors.transparent,
                          ),
                          Container(
                            child: Image.asset(
                              "assets/sad-small.png",
                              width: 40.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    height: 5.0,
                    child: new Center(
                      child: new Container(
                        margin: EdgeInsets.symmetric(horizontal: 32.0),
                        height: 2.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      'Caregiving often calls us to lean into love we didnʼt know possible ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    '- Tia Walker',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/mood'),
                    child: Container(
                      padding: EdgeInsets.only(
                        top: 10.0,
                        left: 10.0,
                        right: 10.0,
                        bottom: 40.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/card-mood.png'),
                        ),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 10),
                      width: deviceWidth * 0.7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image.asset(
                            'assets/mood.png',
                            width: 64,
                          ),
                          Text(
                            'MOOD TRACKER',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/task'),
                    child: Container(
                      padding: EdgeInsets.only(
                        top: 10.0,
                        left: 10.0,
                        right: 10.0,
                        bottom: 40.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/card-task.png'),
                        ),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 10),
                      width: deviceWidth * 0.7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image.asset(
                            'assets/task.png',
                            width: 64,
                          ),
                          Text(
                            'DAILY TASKS',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/support'),
                    child: Container(
                      padding: EdgeInsets.only(
                        top: 10.0,
                        left: 10.0,
                        right: 10.0,
                        bottom: 40.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/card-support.png'),
                        ),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 10),
                      width: deviceWidth * 0.7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image.asset(
                            'assets/support.png',
                            width: 64,
                          ),
                          Text(
                            'SUPPORT GROUP',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/article');
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                        top: 10.0,
                        left: 10.0,
                        right: 10.0,
                        bottom: 40.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/card-article.png'),
                        ),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 10),
                      width: deviceWidth * 0.7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image.asset(
                            'assets/article.png',
                            width: 64,
                          ),
                          Text(
                            'ARTICLES OF THE WEEK',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
