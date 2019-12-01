import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hr/Screens/HR/LoginPage.dart';
class SplashScreen extends StatefulWidget {
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  bool loading;
  double progressValue;
  String splash;
  @override
  void initState() {
    super.initState();
    splash = "lib/assets/images/SplashScreen.png";
    loading = false;
    progressValue = 0.0;
    updateProgress();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(decoration: BoxDecoration(color: Colors.white),),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          width: 300,
                          height: 200,
                          child: Image.asset("$splash")),
                      Padding(padding: EdgeInsets.only(top: 10.0),),
                      Container(
                        width: 150,
                        height: 5,
                        child: LinearProgressIndicator(
                            value: progressValue, backgroundColor: Colors.grey,
                            valueColor: AlwaysStoppedAnimation<Color>(Color(0xffaecb4f))),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  // by updating the progress value
  void updateProgress() {
    const oneSec = const Duration(seconds: 1);
    new Timer.periodic(oneSec, (Timer t) {
      setState(() {
        progressValue += 0.2;
        // we "finish" downloading here
        if (progressValue.toStringAsFixed(1) == '1.0') {
          loading = false;
          t.cancel();
          //to Navigate to Home Screen
          Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (context) => new LoginPage()));
        }
      });
    });
  }
  getAllData()  {
    Timer.periodic(Duration(milliseconds: 200), (Timer timer){
      if(progressValue==1){
        timer.cancel();
      }
      setState(() {
        progressValue += 0.2;
      });
    });
    loading = false;


    return true;
  }
}
