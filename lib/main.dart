import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hr/Provider/HRProvider.dart';
import 'package:provider/provider.dart';
import 'package:hr/Screens/HR/LoginPage.dart';
void main() => runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<HrProvider>(builder: (context){
        return HrProvider();
      },),
    ],
    child: MyApp()));
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
      home: LoginPage(),
    );
  }
}

