import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../models/mood.dart';

class DailyMoodDetailPage extends StatefulWidget {
  Mood _mood;

  DailyMoodDetailPage(this._mood);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DailyMoodDetailPageState();
  }
}

class _DailyMoodDetailPageState extends State<DailyMoodDetailPage> {
  final GlobalKey<FormState> _dailyFormKey = GlobalKey<FormState>();
  Map<String, dynamic> _tempDailyMoodData = {
    'dailyMoodTitle': null,
    'dailyMoodDescription': null,
    'dailyMoodDate': null,
    'dailyMoodLabel': null,
    'dailyMoodIcon': null,
  };

  _submitDailyMoodForm() async {
    final SharedPreferences datePref = await SharedPreferences.getInstance();
    var now = new DateTime.now();
    DateTime date = new DateTime(now.year, now.month, now.day);
    _tempDailyMoodData['dailyMoodLabel'] = widget._mood.moodLabel;
    _tempDailyMoodData['dailyMoodIcon'] = widget._mood.moodImageUrl;
    _tempDailyMoodData['dailyMoodDate'] = date.toString();
    String userId = datePref.getString('userId');

    Map<String, dynamic> dailyMoodRequestData = {userId: _tempDailyMoodData};
    _showDialog();
    var response = await http.post(
        "https://care-buddy-793cb.firebaseio.com/moods/" + userId + ".json",
        body: json.encode(_tempDailyMoodData));

    if (response.statusCode == 200) {
      Navigator.of(context).pop();

      datePref.setString('date', date.toString());
      datePref.setString('moodIcon', widget._mood.moodImageUrl);
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      print(response.statusCode);
    }
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
            margin: EdgeInsets.all(40.0),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
            child: Form(
              key: _dailyFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      'Wanna tell us why?',
                      style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Image.asset(
                        widget._mood.moodImageUrl,
                        width: 96.0,
                      ),
                      Text(
                        widget._mood.moodLabel,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    padding: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color:
                          widget._mood.hexToColor(widget._mood.moodColorTheme),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      'What\'s happening at the moment?',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    padding: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color:
                          widget._mood.hexToColor(widget._mood.moodColorTheme),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Activity Title",
                      ),
                      onSaved: (String value) {
                        _tempDailyMoodData['dailyMoodTitle'] = value;
                      },
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    padding: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color:
                          widget._mood.hexToColor(widget._mood.moodColorTheme),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Activity Description",
                      ),
                      maxLines: 4,
                      onSaved: (String value) {
                        _tempDailyMoodData['dailyMoodDescription'] = value;
                      },
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                    padding: EdgeInsets.all(15.0),
                    width: double.infinity,
                    child: RaisedButton(
                      onPressed: () {
                        _dailyFormKey.currentState.save();
                        _submitDailyMoodForm();
                      },
                      child: Text('SUBMIT'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
