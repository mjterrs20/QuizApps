import 'package:flutter/material.dart';
import 'package:sismul/models/model_quiz.dart';
import 'package:sismul/utils/colors.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

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
    int c = 5 +
        cDetik; // bisa dimainkan dengan detik. c harus lebih besar sama dengan dari akar m  \

    // karena a tidak boleh sama dengan c dan juga saya menemukan error ketika c = 6
    if (c == 11 || c == 6) {
      c = 5;
    }

    for (int x = 0; x < 25; x++) {
      if (x == 0) {
        bilanganAcak[x] = (a * z + c) % m;
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
          appBar: GradientAppBar(
            automaticallyImplyLeading: false,
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
          body: SafeArea(
            child: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Positioned(
                  top: 0.0,
                  child: ClipPath(
                    clipper: CustomShapeClipper(),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 600.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            TemaApp.blueNavyColor,
                            TemaApp.blueSeeColor,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Center(
                        child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 10.0),
                          child: Text("Score : $finalScore",
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w800,
                              )),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 70.0),
                          child: Text("Mari Mengenal Sahabat Nabi!!!",
                              style: TextStyle(
                                fontSize: 25.0,
                                color: TemaApp.orangeColor,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.normal,
                              )),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(11.0, 40.0, 11.0, 10.0),
                          child:
                              Text(quiz.questions[bilanganAcak[questionNumber]],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.normal,
                                  )),
                        ),
                        InkWell(
                          onTap: () {
                            if (quiz.choices[bilanganAcak[questionNumber]][0] ==
                                quiz.correctAnswers[
                                    bilanganAcak[questionNumber]]) {
                              debugPrint("Correct");
                              finalScore++;
                            } else {
                              debugPrint("Wrong");
                            }
                            updateQuestion();
                          },
                          child: Container(
                            height: 50.0,
                            margin: const EdgeInsets.fromLTRB(
                                11.0, 30.0, 11.0, 10.0),
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: Text(
                                  quiz.choices[bilanganAcak[questionNumber]][0],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.normal,
                                  )),
                            ),
                            decoration: BoxDecoration(
                                color: TemaApp.blueDarkColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(40.0),
                                )),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            if (quiz.choices[bilanganAcak[questionNumber]][1] ==
                                quiz.correctAnswers[
                                    bilanganAcak[questionNumber]]) {
                              debugPrint("Correct");
                              finalScore++;
                            } else {
                              debugPrint("Wrong");
                            }
                            updateQuestion();
                          },
                          child: Container(
                            height: 50.0,
                            margin: const EdgeInsets.fromLTRB(
                                11.0, 0.0, 11.0, 10.0),
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: Text(
                                  quiz.choices[bilanganAcak[questionNumber]][1],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.normal,
                                  )),
                            ),
                            decoration: BoxDecoration(
                                color: TemaApp.blueDarkColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(40.0),
                                )),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            if (quiz.choices[bilanganAcak[questionNumber]][2] ==
                                quiz.correctAnswers[
                                    bilanganAcak[questionNumber]]) {
                              debugPrint("Correct");
                              finalScore++;
                            } else {
                              debugPrint("Wrong");
                            }
                            updateQuestion();
                          },
                          child: Container(
                            height: 50.0,
                            margin: const EdgeInsets.fromLTRB(
                                11.0, 0.0, 11.0, 10.0),
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: Text(
                                  quiz.choices[bilanganAcak[questionNumber]][2],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.normal,
                                  )),
                            ),
                            decoration: BoxDecoration(
                                color: TemaApp.blueDarkColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(40.0),
                                )),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            if (quiz.choices[bilanganAcak[questionNumber]][3] ==
                                quiz.correctAnswers[
                                    bilanganAcak[questionNumber]]) {
                              debugPrint("Correct");
                              finalScore++;
                            } else {
                              debugPrint("Wrong");
                            }
                            updateQuestion();
                          },
                          child: Container(
                            height: 50.0,
                            margin: const EdgeInsets.fromLTRB(
                                11.0, 0.0, 11.0, 10.0),
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: Text(
                                  quiz.choices[bilanganAcak[questionNumber]][3],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.normal,
                                  )),
                            ),
                            decoration: BoxDecoration(
                                color: TemaApp.blueDarkColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(40.0),
                                )),
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          margin: const EdgeInsets.only(top: 50.0),
                          child: MaterialButton(
                            minWidth: 100.0,
                            height: 50.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            color: TemaApp.orangeColor,
                            onPressed: resetQuiz,
                            child: Text("Quit",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: TemaApp.whiteColor,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.normal,
                                )),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 12.0, top: 100.0),
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                              "Pertanyaan ${questionNumber + 1} dari ${quiz.questions.length}",
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.normal,
                              )),
                        ),
                      ],
                    )),
                  ],
                ),
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

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0.0, size.height);

    var firstEndPoint = Offset(size.width * 0.5, size.height - 300.0);
    var firstControlpoint = Offset(size.width * 0.25, size.height - 300.0);
    path.quadraticBezierTo(firstControlpoint.dx, firstControlpoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 550.0);
    var secondControlpoint = Offset(size.width * 0.75, size.height - 300.0);
    path.quadraticBezierTo(secondControlpoint.dx, secondControlpoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    // path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
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
                  style: TextStyle(
                      fontSize: 35.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.normal),
                ),
                Padding(padding: EdgeInsets.all(30.0)),
                MaterialButton(
                  color: TemaApp.orangeColor,
                  onPressed: () {
                    questionNumber = 0;
                    finalScore = 0;
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Reset Quiz",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.normal),
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
