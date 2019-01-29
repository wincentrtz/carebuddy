import 'package:flutter/material.dart';
import '../models/mood-trend.dart';

class MoodDetailPage extends StatelessWidget {
  MoodTrend moodTrend;

  MoodDetailPage(this.moodTrend);

  List<String> months = [
    'JANUARI',
    'FEBRUARY',
    'MARCH',
    'APRIL',
    'MAY',
    'JUNE',
    'JULY',
    'AUGUST',
    'SEPTEMBER',
    'OCTOBER',
    'NOVEMBER',
    'DECEMBER'
  ];

  Map<String, Color> colorMoodTrend = {
    'Amazing': Color(0xFFffd11f),
    'Good': Color(0xFF3b8740),
    'So-So': Color(0xFF73c176),
    'A bit gloomy': Color(0xFF4e8cc9),
    'Stressed': Color(0xFF99999a),
  };

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: deviceWidth,
              decoration: BoxDecoration(
                color: colorMoodTrend[moodTrend.dailyMoodLabel],
              ),
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
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 44.0, bottom: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          moodTrend.dailyMoodDate.day.toString(),
                          style: TextStyle(
                            fontSize: 56.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          months[moodTrend.dailyMoodDate.month - 1],
                          style: TextStyle(
                            fontSize: 32.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          moodTrend.dailyMoodDate.year.toString(),
                          style: TextStyle(
                            fontSize: 32.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 40.0, right: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    moodTrend.dailyMoodTitle,
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      color: colorMoodTrend[moodTrend.dailyMoodLabel],
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    moodTrend.dailyMoodDescription,
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  )
                ],
              ),
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment(0.8,
                              0.0), // 10% of the width, so there are ten blinds.
                          colors: [
                            Color(0xFFef7c5a),
                            Color(0xFFf05e70)
                          ], // whitish to gray
                          tileMode: TileMode
                              .clamp, // repeats the gradient over the canvas
                        ),
                        borderRadius: BorderRadius.circular(30.0)),
                    padding: EdgeInsets.all(10.0),
                    width: deviceWidth,
                    margin: EdgeInsets.symmetric(
                      vertical: 40.0,
                      horizontal: 60.0,
                    ),
                    child: Text(
                      'Share with others',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
