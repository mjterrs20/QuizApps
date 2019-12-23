
// masih tahap pengembangan, jadi harus dibenarkan terutama tentang permissions

/*
import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart';
import 'package:sismul/pages/qr_quiz.dart';

class QrPage extends StatefulWidget {
  @override
  _QrPageState createState() => _QrPageState();
}

class _QrPageState extends State<QrPage> {
  String data = "QR Code Soal";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(data,style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),),
            RaisedButton(
              child: Text("Scan QR"),
              onPressed: () {
                scanQR();
              },
            ),
          ],
        ),
      ),
    );
  }

  void scanQR() async {
    // masih belum bisa check permissions

    // bool isShown = await PermissionHandler().shouldShowRequestPermissionRationale(PermissionGroup.camera);
    // PermissionStatus status = PermissionStatus.unknown;
    String scanResult  = await scan();
    setState(() {
      data = scanResult;
      Navigator.push(
        context,
        MaterialPageRoute(builder:(BuildContext context) => 
        QrQuizPage(data)));
    });
  }
}

*/
