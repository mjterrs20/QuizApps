import 'package:flutter/material.dart';
import 'package:sismul/pages/home.dart';
import 'package:sismul/pages/quiz.dart';
// import 'package:sismul/pages/qr.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      title: 'Quiz',
      home: HomePage(),
      routes: <String, WidgetBuilder>{
        '/homepage': (BuildContext context) => HomePage(),
        '/quizpage': (BuildContext context) => QuizPage(),
        // '/qrpage': (BuildContext context) => QrPage(),
      },
      theme: ThemeData(
        primaryColor: Colors.green[600],
        primaryColorLight: Colors.amber[400],
        primaryIconTheme:
            Theme.of(context).primaryIconTheme.copyWith(color: Colors.white),
        primaryTextTheme: TextTheme(title: TextStyle(color: Colors.white)),
      ),
    );
  }
}


