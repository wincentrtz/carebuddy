import 'package:flutter/material.dart';

import '../models/user.dart';
import './mood.dart';
import './task.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double deviceHeigth = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 60.0),
        height: deviceHeigth,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment(
                0.8, 0.0), // 10% of the width, so there are ten blinds.
            colors: [Color(0xFF25263b), Color(0xFF267EA0)], // whitish to gray
            tileMode: TileMode.clamp, // repeats the gradient over the canvas
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      'HELLO,',
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'ALVIN',
                      style: TextStyle(
                        fontSize: 36,
                        color: Colors.white,
                      ),
                    ),
                  ],
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
                        'assets/good-small.png',
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
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation) {
                      return MoodPage();
                    },
                    transitionsBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation,
                        Widget child) {
                      return SlideTransition(
                        position: new Tween<Offset>(
                          begin: const Offset(1.0, 0.0),
                          end: Offset.zero,
                        ).animate(animation),
                        child: new SlideTransition(
                          position: new Tween<Offset>(
                            begin: Offset.zero,
                            end: const Offset(0.0, 1.0),
                          ).animate(secondaryAnimation),
                          child: child,
                        ),
                      );
                    },
                  ),
                );
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
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation) {
                      return TaskPage();
                    },
                    transitionsBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation,
                        Widget child) {
                      return SlideTransition(
                        position: new Tween<Offset>(
                          begin: const Offset(1.0, 0.0),
                          end: Offset.zero,
                        ).animate(animation),
                        child: new SlideTransition(
                          position: new Tween<Offset>(
                            begin: Offset.zero,
                            end: const Offset(0.0, 1.0),
                          ).animate(secondaryAnimation),
                          child: child,
                        ),
                      );
                    },
                  ),
                );
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
