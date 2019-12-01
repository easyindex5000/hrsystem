import 'package:flutter/material.dart';
import 'package:hr/Component/TextFormInput.dart';
import 'package:hr/Provider/Colors.dart';
import 'package:hr/Provider/HRProvider.dart';
import 'package:hr/Screens/HR/Home%20HR.dart';
import 'package:provider/provider.dart';

import 'ForgetPassword.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  Color danger = ColorsProvider().primary;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar("SIGN IN"),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        maxLength: 45,
                        keyboardType: TextInputType.emailAddress,
                        autovalidate: true,
                        validator: _validateEmail,
                        decoration: InputDecoration(
                          labelText: "E-Mail",
                          counterText: "",

                        ),
                      ),

                      Consumer<HrProvider>(
                        builder: (context, hrProvider,_) {
                          return TextFormField(
                            obscureText: hrProvider.securePassword,
                            controller: passwordController,
                            maxLength: 32,
                            autovalidate: true,
                            validator: (value){
                             if(value.isEmpty){
                                return null;
                              }
                            else if(value.length<8){
                               return "Please Enter more than 8 ";
                             }
                              else return null;
                            },
                            decoration: InputDecoration(
                              labelText: "Password",
                              counterText: "",
                              suffixIcon: IconButton(
                                icon: Icon(Icons.remove_red_eye),
                                color: danger,
                                onPressed: (){
                                  if (danger == ColorsProvider().primary) {
                                    setState(() {danger = Colors.red;});
                                  } else if (danger == Colors.red) {
                                    setState(() {danger = ColorsProvider().primary;});
                                  }
                                  bool viewHide =
                                  hrProvider.securePassword == true ? false : true;
                                  hrProvider.securePassword = viewHide;
                                },
                              ),
                            ),
                          );
                        }
                      ),
                      SizedBox(height: 20,),
                      ButtonTheme(
                        minWidth: MediaQuery.of(context).size.width *1.2,
                        height: 40,
                        child: RaisedButton(
                          onPressed: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context) => HomeScreen()));

                          },
                          child: Text("SIGN IN",style: TextStyle(color: Colors.white,fontSize: 18),),
                          color: ColorsProvider().primary,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          FlatButton(
                            child: Text("Forget Password?",style: TextStyle(color: ColorsProvider().primary),),
                            onPressed: (){

                              Navigator.push(context,MaterialPageRoute(builder: (context) => ForgetPassword()));
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  String _validateEmail(String value) {
    if (value.isEmpty) {
      // The form is empty
      return null;
    }
    // This is just a regular expression for email addresses
    String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
        "\\@" +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
        "(" +
        "\\." +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
        ")+";
    RegExp regExp = new RegExp(p);

    if (regExp.hasMatch(value)) {
      // So, the email is valid
      return "Please Enter valid email address";
    }

    // The pattern of the email didn't match the regex above.
    return 'Email is not valid';
  }

}
