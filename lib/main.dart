import 'package:flutter/material.dart';

import './pages/login.dart';
import './pages/daily-mood.dart';
import './pages/home.dart';
import './pages/mood.dart';
import './pages/task.dart';
import './pages/add-task.dart';
import './pages/mood-detail.dart';
import './pages/article.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
        '/home': (BuildContext context) => HomePage(),
        '/mood': (BuildContext context) => MoodPage(),
        '/task': (BuildContext context) => TaskPage(),
        '/add-task': (BuildContext context) => AddTaskPage(),
        '/mood-detail': (BuildContext context) => MoodDetailPage(),
        '/article': (BuildContext context) => ArticlePage()
      },
    );
  }
}
