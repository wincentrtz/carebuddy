import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../models/mood.dart';
import './daily-mood-detail.dart';

class DailyMoodPage extends StatelessWidget {
  @override
  final List<Mood> _moods;

  DailyMoodPage(this._moods);

  Widget _buildMoodListTile(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return DailyMoodDetailPage(_moods[index]);
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
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Image.asset(
              _moods[index].moodImageUrl,
              width: 88.0,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              _moods[index].moodLabel,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
                color: _moods[index].hexToColor(_moods[index].moodColorTheme),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
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
        width: deviceWidth,
        padding: EdgeInsets.all(10.0),
        child: Container(
          width: deviceWidth * 0.8,
          margin: EdgeInsets.all(20),
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
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: _buildMoodListTile,
                  itemCount: _moods.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
