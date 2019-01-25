import 'package:flutter/material.dart';

import './pages/login.dart';
import './pages/daily-mood.dart';
import './pages/daily-mood-detail.dart';
import './pages/home.dart';
import './pages/mood.dart';
import './pages/task.dart';
import './pages/add-task.dart';
import './pages/mood-detail.dart';
import './pages/article.dart';
import './pages/article-detail.dart';
import './pages/support.dart';
import './pages/calendar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

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

  int mood;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: LoginPage(),
        routes: {
          '/login': (BuildContext context) => LoginPage(),
          '/daily-mood': (BuildContext context) => DailyMoodPage(),
          '/daily-mood-detail': (BuildContext context) => DailyMoodDetailPage(),
          '/home': (BuildContext context) => HomePage(),
          '/mood': (BuildContext context) => MoodPage(),
          '/task': (BuildContext context) => TaskPage(),
          '/add-task': (BuildContext context) => AddTaskPage(),
          '/mood-detail': (BuildContext context) => MoodDetailPage(),
          '/article': (BuildContext context) =>
              ArticlePage(articles, articleOld),
          '/support': (BuildContext context) => SupportPage(),
          '/calendar': (BuildContext context) => CalendarPage(),
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
          }
          return null;
        });
  }
}
