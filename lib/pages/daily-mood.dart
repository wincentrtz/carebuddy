import 'package:flutter/material.dart';

class DailyMoodPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment(
                0.8, 0.0), // 10% of the width, so there are ten blinds.
            colors: [Color(0xFF25263b), Color(0xFF267EA0)], // whitish to gray
            tileMode: TileMode.clamp, // repeats the gradient over the canvas
          ),
        ),
        padding: EdgeInsets.all(10.0),
        child: Container(
          margin: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Tell us how ',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              Text(
                'you feel today!',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/home');
                      },
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            'assets/amazing.png',
                            width: 96.0,
                          ),
                          Text(
                            'Amazing!',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24.0,
                              color: Color(0xFFFFD11F),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Image.asset(
                          'assets/good.png',
                          width: 96.0,
                        ),
                        Text(
                          'Good',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0,
                            color: Color(0xFF3B8740),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Image.asset(
                          'assets/so.png',
                          width: 96.0,
                        ),
                        Text(
                          'So - So',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0,
                            color: Color(0xFF73C176),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Image.asset(
                          'assets/gloomy.png',
                          width: 96.0,
                        ),
                        Text(
                          'A bit \ngloomy!',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0,
                            color: Color(0xFF4E8CC9),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Image.asset(
                          'assets/sad.png',
                          width: 96.0,
                        ),
                        Text(
                          'Stressed',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0,
                            color: Color(0xFF99999a),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
