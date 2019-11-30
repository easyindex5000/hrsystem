import 'package:flutter/material.dart';
import 'package:hr/Component/TextFormInput.dart';
import 'package:hr/Provider/Colors.dart';
class SecondContranctPage extends StatefulWidget {
  @override
  _SecondContranctPageState createState() => _SecondContranctPageState();
}

class _SecondContranctPageState extends State<SecondContranctPage> {
  TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar("New Contract"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  buildTextFormField("AD Description in English",30,TextInputType.text,passwordController),
                  buildTextFormField("AD Description in Arabic",30,TextInputType.text,passwordController),
                  buildTextFormField("Key Words",30,TextInputType.text,passwordController),
                  buildTextFormField("Available Jobs",30,TextInputType.text,passwordController),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:Padding(
        padding: const EdgeInsets.all(24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            ButtonTheme(
              minWidth: MediaQuery.of(context).size.width /2.8,
              child:OutlineButton(
                child: Text("Save For Later",style: TextStyle(color: ColorsProvider().primary),),
                onPressed: (){},
                color: ColorsProvider().primary,
              ),
            ),
            ButtonTheme(
              minWidth: MediaQuery.of(context).size.width /2.8,
              child: RaisedButton(
                child: Text("Sumbit",style: TextStyle(color: Colors.white),),
                onPressed: (){},
                color: ColorsProvider().primary,

              ),
            ),

          ],
        ),
      ),
    );
  }
}
