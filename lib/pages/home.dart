import 'package:flutter/material.dart';
import 'package:sismul/pages/quiz.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz"),
      ),
      body: Container(
        margin: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             MaterialButton(
                height: 50.0,
                color: Colors.green,
                onPressed: startQuiz,
                child:  Text(
                  "Quiz App",
                  style:  TextStyle(fontSize: 18.0, color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
  void startQuiz(){
   setState(() {
     Navigator.push(context, MaterialPageRoute(builder: (context)=> QuizPage()));
   });
  }
}
