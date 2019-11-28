import 'package:flutter/material.dart';
import 'package:hr/Component/TextFormInput.dart';
import 'package:hr/Provider/Colors.dart';
import 'package:hr/Screens/HR/LoginPage.dart';
class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController emailController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
    appBar: buildAppBar("Forget Password"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Enter your E-mail to reset your password"),
            SizedBox(height: 20,),
            SingleChildScrollView(
              child: buildTextFormField("E-Mail",60,TextInputType.emailAddress,emailController)
            ),
            SizedBox(height: 20,),
            ButtonTheme(
              minWidth: MediaQuery.of(context).size.width *1.2,
              height: 40,
              child: RaisedButton(
                child: Text("SUBMIT",style: TextStyle(color: Colors.white,fontSize: 17),),
                color: ColorsProvider().primary,
                onPressed: (){
                  if(emailController.text==""){

                  }
                  else{
                    _alertDialog();
                  }
            //      Navigator.push(context,MaterialPageRoute(builder: (context) => PersonalPage()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> _alertDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          title: Text('New password send to your E-mail',style: TextStyle(color: ColorsProvider().primary,fontSize: 15),),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                RaisedButton(
                  child: Text('SIGN IN',style: TextStyle(color: Colors.white),),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (context) => new LoginPage()));
                  },
                  color: ColorsProvider().primary,
                ),
              ],
            ),
          ),
//          actions: <Widget>[
//
//          ],
        );
      },
    );
  }
}
