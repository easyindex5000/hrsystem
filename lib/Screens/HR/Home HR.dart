import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hr/Component/mainDrawer.dart';
import 'package:hr/Provider/Colors.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("home",style: TextStyle(color: ColorsProvider().primary),),
        leading:  IconButton(
            icon: new Icon(Icons.menu, color: ColorsProvider().primary),
            onPressed: () => _scaffoldKey.currentState.openDrawer()),
      ),
      key: _scaffoldKey,
      drawer: mainDrawer(context,"home"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(child: ClipRect(child: Image.asset("lib/assets/images/404.png",width: 200,height: 200,),),),
            Text("Easy Index",style: TextStyle(color: ColorsProvider().primary,fontSize: 18,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
