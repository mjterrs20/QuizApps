import 'package:flutter/material.dart';
import 'package:sismul/models/model_quiz.dart';

var finalScore = 0;
var questionNumber = 0;
var quiz = new Quiz();
List<int> bilanganAcak = new List(25);


class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  void initState() {
    super.initState();
    // ambil detik sekarang
    DateTime _waktu = DateTime.now();
    int detik = _waktu.second;

    // convert detik agar tidak lebih 20 karena soal hanya 25
    int cDetik = 0;
    cDetik = detik % 20; 

    // algoritma LCM
    // a dan c tidak boleh sama
    int m = 25; // tetep karena harus maximal
    int z = 1; // bisa tetap atau dimainkan nilai awal
    int a = 11; // bisa tetap
    int c = 5 + cDetik; // bisa dimainkan dengan detik. c harus lebih besar sama dengan dari akar m  \

    // karena a tidak boleh sama dengan c dan juga saya menemukan error ketika c = 6
    if (c == 11 || c == 6){
      c = 5;
    }

    for (int x = 0; x < 25; x++) {
    if (x == 0) {
      bilanganAcak[x] = (a * z + c ) % m;
      print(bilanganAcak[x].toString());
    } else {
      bilanganAcak[x] = (a * (bilanganAcak[x - 1] - 1) + c) % m;
      print(bilanganAcak[x].toString());
    }
  }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          body: Container(
            margin: const EdgeInsets.all(10.0),
            alignment: Alignment.topCenter,
            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.all(20.0)),

                Container(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Question ${questionNumber + 1} of ${quiz.questions.length}",
                        style: TextStyle(fontSize: 22.0),
                      ),
                      Text(
                        "Score: $finalScore",
                        style: TextStyle(fontSize: 22.0),
                      )
                    ],
                  ),
                ),

                //image
                Padding(padding: EdgeInsets.all(10.0)),

                Image.asset(
                  "assets/images/abhypraya.png",
                  width: 50.0,
                  height: 50.0,
                ),

                Padding(padding: EdgeInsets.all(10.0)),

                Text(
                  quiz.questions[bilanganAcak[questionNumber]],
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),

                Padding(padding: EdgeInsets.all(10.0)),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    //button 1
                    MaterialButton(
                      minWidth: 120.0,
                      color: Colors.blueGrey,
                      onPressed: () {
                        if (quiz.choices[bilanganAcak[questionNumber]][0] ==
                            quiz.correctAnswers[bilanganAcak[questionNumber]]) {
                          debugPrint("Correct");
                          finalScore++;
                        } else {
                          debugPrint("Wrong");
                        }
                        updateQuestion();
                      },
                      child: Text(
                        quiz.choices[bilanganAcak[questionNumber]][0],
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    ),

                    //button 2
                    MaterialButton(
                      minWidth: 120.0,
                      color: Colors.blueGrey,
                      onPressed: () {
                        if (quiz.choices[bilanganAcak[questionNumber]][1] ==
                            quiz.correctAnswers[bilanganAcak[questionNumber]]) {
                          debugPrint("Correct");
                          finalScore++;
                        } else {
                          debugPrint("Wrong");
                        }
                        updateQuestion();
                      },
                      child: Text(
                        quiz.choices[bilanganAcak[questionNumber]][1],
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    ),
                  ],
                ),

                Padding(padding: EdgeInsets.all(10.0)),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    //button 3
                    MaterialButton(
                      minWidth: 120.0,
                      color: Colors.blueGrey,
                      onPressed: () {
                        if (quiz.choices[bilanganAcak[questionNumber]][2] ==
                            quiz.correctAnswers[bilanganAcak[questionNumber]]) {
                          debugPrint("Correct");
                          finalScore++;
                        } else {
                          debugPrint("Wrong");
                        }
                        updateQuestion();
                      },
                      child: Text(
                        quiz.choices[bilanganAcak[questionNumber]][2],
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    ),

                    //button 4
                    MaterialButton(
                      minWidth: 120.0,
                      color: Colors.blueGrey,
                      onPressed: () {
                        if (quiz.choices[bilanganAcak[questionNumber]][3] ==
                            quiz.correctAnswers[bilanganAcak[questionNumber]]) {
                          debugPrint("Correct");
                          finalScore++;
                        } else {
                          debugPrint("Wrong");
                        }
                        updateQuestion();
                      },
                      child: Text(
                        quiz.choices[bilanganAcak[questionNumber]][3],
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    ),
                  ],
                ),

                Padding(padding: EdgeInsets.all(15.0)),

                Container(
                    alignment: Alignment.bottomCenter,
                    child: MaterialButton(
                        minWidth: 240.0,
                        height: 30.0,
                        color: Colors.red,
                        onPressed: resetQuiz,
                        child: Text(
                          "Quit",
                          style: TextStyle(fontSize: 18.0, color: Colors.white),
                        ))),
              ],
            ),
          ),
        ));
  }

  void resetQuiz() {
    setState(() {
      Navigator.pop(context);
      finalScore = 0;
      questionNumber = 0;
    });
  }

  void updateQuestion() {
    setState(() {
      if (questionNumber == quiz.questions.length - 1) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Summary(
                      score: finalScore,
                    )));
      } else {
        questionNumber++;
      }
    });
  }
}

class Summary extends StatelessWidget {
  final int score;
  Summary({Key key, @required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Final Score: $score",
                  style: TextStyle(fontSize: 35.0),
                ),
                Padding(padding: EdgeInsets.all(30.0)),
                MaterialButton(
                  color: Colors.red,
                  onPressed: () {
                    questionNumber = 0;
                    finalScore = 0;
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Reset Quiz",
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
