import 'package:flutter/material.dart';

import '../models/mood-trend.dart';

class MoodPage extends StatefulWidget {
  List<MoodTrend> moodTrends;
  Function getMoodTrendPreferences;

  MoodPage(this.moodTrends, this.getMoodTrendPreferences);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MoodPageState();
  }
}

class _MoodPageState extends State<MoodPage> {
  List<String> months = [
    'JAN',
    'FEB',
    'MAR',
    'APR',
    'MAY',
    'JUN',
    'JUL',
    'AUG',
    'SEP',
    'OCT',
    'NOV',
    'DEC'
  ];

  Map<String, Color> colorMoodTrend = {
    'Amazing': Color(0xFFffd11f),
    'Good': Color(0xFF3b8740),
    'So-So': Color(0xFF73c176),
    'A bit gloomy': Color(0xFF4e8cc9),
    'Stressed': Color(0xFF99999a),
  };

  @override
  void initState() {
    // TODO: implement initState
    widget.getMoodTrendPreferences();
    super.initState();
  }

  Widget _buildMoodTrendList(context, index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 48.0),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/mood-detail/' + index.toString());
            },
            child: Container(
              margin: EdgeInsets.only(top: 30.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: colorMoodTrend[widget.moodTrends[index].dailyMoodLabel],
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(0, 0, 0, 0.2),
                    ),
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      widget.moodTrends[index].dailyMoodDate.day.toString() +
                          "\n" +
                          months[
                              widget.moodTrends[index].dailyMoodDate.month - 1],
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    widget.moodTrends[index].dailyMoodTitle,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: deviceWidth,
              decoration: BoxDecoration(
                color: Color(0xFF73c176),
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
                          'MOOD TRACKER',
                          style: TextStyle(
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'Your mood journal for the last 5 days',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            widget.moodTrends == null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Color(0xFF73c176)),
                      ),
                    ],
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: _buildMoodTrendList,
                    itemCount: widget.moodTrends.length,
                  ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/mood-trend'),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF1a4687),
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                margin: EdgeInsets.only(top: 20),
                width: deviceWidth * 0.7,
                child: Text(
                  'Mood Trends',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
