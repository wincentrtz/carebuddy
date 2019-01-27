import 'package:flutter/material.dart';

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

class MyApp extends StatelessWidget {
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
    'Article 3 Title'
  ];
  final List<String> articleOld = [
    'Article 4 Title',
    'Article 5 Title',
    'Article 6 Title',
    'Article 7 Title',
    'Article 8 Title',
    'Article 9 Title'
  ];

  User user;

  void setUserAccount(Map<String, dynamic> userData) {
    user = new User(userData['name'], userData['gender'], userData['dob'],
        userData['phone'], userData['email'], userData['password']);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      routes: {
        '/login': (BuildContext context) => LoginPage(),
        '/register': (BuildContext context) => RegisterPage(setUserAccount),
        '/daily-mood': (BuildContext context) => DailyMoodPage(moods),
        '/home': (BuildContext context) => HomePage(),
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
}
