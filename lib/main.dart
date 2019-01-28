import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import './models/mood.dart';
import './models/user.dart';

import './pages/login.dart';
import './pages/register.dart';
import './pages/daily-mood.dart';
import './pages/home.dart';
import './pages/mood.dart';
import './pages/task.dart';
import './pages/add-task.dart';
import './pages/mood-detail.dart';
import './pages/article.dart';
import './pages/article-detail.dart';
import './pages/support.dart';
import './pages/calendar.dart';
import './pages/support-detail.dart';
import './pages/mood-trend.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final List<Mood> moods = [
    Mood(
        moodLabel: 'Amazing',
        moodImageUrl: 'assets/amazing.png',
        moodColorTheme: '#ffd11f'),
    Mood(
        moodLabel: 'Good',
        moodImageUrl: 'assets/good.png',
        moodColorTheme: '#3b8740'),
    Mood(
        moodLabel: 'So-So',
        moodImageUrl: 'assets/so.png',
        moodColorTheme: '#73c176'),
    Mood(
        moodLabel: 'A bit gloomy',
        moodImageUrl: 'assets/gloomy.png',
        moodColorTheme: '#4e8cc9'),
    Mood(
        moodLabel: 'Stressed',
        moodImageUrl: 'assets/sad.png',
        moodColorTheme: '#99999a'),
  ];

  final List<String> articles = [
    'Article 1 Title',
    'Article 2 Title',
  ];
  final List<String> articleOld = [
    'Article 4 Title',
    'Article 5 Title',
    'Article 6 Title',
    'Article 7 Title',
  ];

  User user;
  bool dateDiff;

  void setUserAccount(Map<String, dynamic> userData, String userUniqueId) {
    setState(() {
      if (userData[userUniqueId] == null) {
        user = new User(
          userUniqueId,
          userData['username'],
          userData['gender'],
          userData['dob'],
          userData['phone'],
        );
      } else {
        user = new User(
          userUniqueId,
          userData[userUniqueId]['username'],
          userData[userUniqueId]['gender'],
          userData[userUniqueId]['dob'],
          userData[userUniqueId]['phone'],
        );
      }
    });
  }

  void checkUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String userCheck = prefs.getString('tokenId');
    String userId = prefs.getString('userId');
    if (userCheck != null) {
      checkDatePref();
      var responseUserData = await http
          .get('https://care-buddy-793cb.firebaseio.com/' + userId + '/.json');
      final Map<String, dynamic> usersData = json.decode(responseUserData.body);
      String userUniqueId;
      usersData.forEach((String randomId, dynamic userData) {
        userUniqueId = randomId;
      });
      setUserAccount(usersData, userUniqueId);
    }
  }

  void checkDatePref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String datePref = prefs.getString('date');
    DateTime today = DateTime.now();
    DateTime datePrefParse = DateTime.parse(datePref);
    if (datePrefParse.difference(today) == 0) {
      dateDiff = false;
    } else {
      dateDiff = true;
    }
  }

  @override
  void didUpdateWidget(MyApp oldWidget) {
    // TODO: implement didUpdateWidget
    print("CHECK : " + user.userName);
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (BuildContext context) {
          if (user != null) {
            if (dateDiff) {
              return DailyMoodPage(moods);
            } else {
              return HomePage(user, setUserAccount, checkUser);
            }
          } else {
            return LoginPage(setUserAccount);
          }
        },
        '/register': (BuildContext context) => RegisterPage(setUserAccount),
        '/daily-mood': (BuildContext context) => DailyMoodPage(moods),
        '/home': (BuildContext context) =>
            HomePage(user, setUserAccount, checkUser),
        '/mood': (BuildContext context) => MoodPage(),
        '/task': (BuildContext context) => TaskPage(),
        '/add-task': (BuildContext context) => AddTaskPage(),
        '/mood-detail': (BuildContext context) => MoodDetailPage(),
        '/article': (BuildContext context) => ArticlePage(articles, articleOld),
        '/support': (BuildContext context) => SupportPage(),
        '/support-detail': (BuildContext context) => SupportDetailPage(),
        '/calendar': (BuildContext context) => CalendarPage(),
        '/mood-trend': (BuildContext context) => MoodTrendPage(),
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split('/');
        if (pathElements[0] != '') {
          return null;
        }
        if (pathElements[1] == 'article-detail') {
          final int index = int.parse(pathElements[2]);
          return MaterialPageRoute(
            builder: (BuildContext context) =>
                ArticleDetailPage(articles[index], index),
          );
        } else if (pathElements[1] == 'daily-mood-detail') {
          final int index = int.parse(pathElements[2]);
          return MaterialPageRoute(
            builder: (BuildContext context) =>
                ArticleDetailPage(articles[index], index),
          );
        }
        return null;
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkUser();
  }
}
