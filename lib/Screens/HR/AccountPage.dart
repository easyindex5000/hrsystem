import 'package:flutter/material.dart';
import 'package:hr/Component/TextFormInput.dart';
import 'package:hr/Component/customProgress.dart';
import 'package:hr/Provider/Colors.dart';
class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar("Form"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            CustomProgressBar(3),
            Expanded(
              child: ListView(
                children: <Widget>[
                  buildTextFormField("Bank Name",30,TextInputType.text,passwordController),
                  buildTextFormField("Bank Account",30,TextInputType.text,passwordController),
                  buildTextFormField("Iban code",30,TextInputType.text,passwordController),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ButtonTheme(
                        minWidth: MediaQuery.of(context).size.width /1.2,
                        height: 45,
                        child: RaisedButton(
                          onPressed: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context) => AccountPage()));
                          },
                          color: ColorsProvider().primary,
                          child: Text("Register ",style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ],),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}
