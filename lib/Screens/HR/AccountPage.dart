import 'package:flutter/material.dart';
import 'package:hr/Component/TextFormInput.dart';
import 'package:hr/Component/customProgress.dart';
import 'package:hr/Provider/Colors.dart';
class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  TextEditingController bankNameController,
  BankAccount,ibaNController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar("Form"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            CustomProgressBar(3,1),
            Expanded(
              child: ListView(
                children: <Widget>[
                  buildTextFormField("Bank Name",30,TextInputType.text,bankNameController),
                  buildTextFormField("Bank Account",30,TextInputType.text,BankAccount),
                  buildTextFormField("Iban code",30,TextInputType.text,ibaNController),
                  SizedBox(height: 30,),
                ],
              ),
            ),
          ],
        ),
      ),
bottomNavigationBar: Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      ButtonTheme(
        minWidth: MediaQuery.of(context).size.width /1.2,
        height: 45,
        child: RaisedButton(
          onPressed: (){},
          color: ColorsProvider().primary,
          child: Text("Register ",style: TextStyle(color: Colors.white),),
        ),
      ),
    ],),
),
    );
  }
}
