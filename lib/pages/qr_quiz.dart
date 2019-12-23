import 'package:flutter/material.dart';
import 'package:sismul/utils/colors.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QrQuizPage extends StatefulWidget {
  QrQuizPage(this.docId);
  final docId;
  @override
  _QrQuizPageState createState() => _QrQuizPageState();
}

class _QrQuizPageState extends State<QrQuizPage> {
  String docId = '';
  var finalScore = 0;
  var questionNumber = 0;
  void initState() {
    super.initState();
    docId = widget.docId.toString() + '12';
    print(docId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: StreamBuilder(
          stream: Firestore.instance
              .collection('soals')
              .document(widget.docId.toString())
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                  child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Color(0xFFB60000))));
            }
            var contentDocument = snapshot.data;
            return Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Center(
                        child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 10.0),
                          child: Text("Score : 0",
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
                          child: Text(
                              contentDocument['soal'] != null
                                  ? contentDocument['soal']
                                  : '',
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
                            
                          },
                          child: Container(
                            height: 50.0,
                            margin: const EdgeInsets.fromLTRB(
                                11.0, 30.0, 11.0, 10.0),
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: Text(
                                 contentDocument['pertanyaan1'] != null
                                  ? contentDocument['pertanyaan1']
                                  : '',
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
                            
                          },
                          child: Container(
                            height: 50.0,
                            margin: const EdgeInsets.fromLTRB(
                                11.0, 0.0, 11.0, 10.0),
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: Text(
                                  contentDocument['pertanyaan2'] != null
                                  ? contentDocument['pertanyaan2']
                                  : '',
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
                            
                          },
                          child: Container(
                            height: 50.0,
                            margin: const EdgeInsets.fromLTRB(
                                11.0, 0.0, 11.0, 10.0),
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: Text(
                                 contentDocument['pertanyaan3'] != null
                                  ? contentDocument['pertanyaan3']
                                  : '',
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
                          },
                          child: Container(
                            height: 50.0,
                            margin: const EdgeInsets.fromLTRB(
                                11.0, 0.0, 11.0, 10.0),
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: Text(
                                  contentDocument['pertanyaan4'] != null
                                  ? contentDocument['pertanyaan4']
                                  : '',
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
                            onPressed: (){},
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
                              "Pertanyaan 1 dari 1",
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
            );
          }),
    );
  }
}
