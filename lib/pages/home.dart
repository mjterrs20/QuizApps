import 'package:flutter/material.dart';
import 'package:sismul/pages/quiz.dart';
import 'package:sismul/utils/colors.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Quiz Apps",
          style: TextStyle(
            fontFamily: 'Roboto',
            color: Colors.white,
          ),
        ),
        gradient: LinearGradient(
          colors: [
            TemaApp.blueNavyColor,
            TemaApp.blueSeeColor,
          ],
          tileMode: TileMode.clamp,
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        margin: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
                height: 50.0,
                color: TemaApp.blueDarkColor,
                onPressed: () {},
                child: Text(
                  "Scan Quiz",
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                )),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
            ),
            MaterialButton(
                height: 50.0,
                color: TemaApp.blueDarkColor,
                onPressed: startQuiz,
                child: Text(
                  "Quiz App",
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }

  void startQuiz() {
    setState(() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => QuizPage()));
    });
  }
}
