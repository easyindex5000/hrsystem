import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hr/Screens/HR/Home%20HR.dart';
class SplashScreen extends StatefulWidget {
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  bool loading;
  double progressValue;
  String splash;
  String splash2;
  @override
  void initState() {
    super.initState();
    splash = "lib/assets/images/SplashScreen.png";
    splash2 = "lib/assets/images/SplashScreen2.png";
    loading = false;
    progressValue = 0.0;
    updateProgress();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 150,
                height: 150,
                child: Image.asset("$splash"),
              ),
              Container(
                width: 150,
                height: 150,
                child: Image.asset("$splash2"),
              ),
            ],
          ),
          SizedBox(height: 50,),
          Container(
            width: 150,
            height: 5,
            child: LinearProgressIndicator(
                value: progressValue, backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xff46c1be))),
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
          Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (context) => new HomeScreen()));
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
