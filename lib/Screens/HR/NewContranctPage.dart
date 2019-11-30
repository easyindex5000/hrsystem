import 'package:flutter/material.dart';
import 'package:hr/Component/TextFormInput.dart';
import 'package:hr/Provider/Colors.dart';
import 'package:hr/Screens/HR/SecondContranctPage.dart';
class NewContranctPage extends StatefulWidget {
  @override
  _NewContranctPageState createState() => _NewContranctPageState();
}

class _NewContranctPageState extends State<NewContranctPage> {
  TextEditingController emailController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:buildAppBar("New Contract") ,
      body:Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  buildTextFormField("Company Name in English",20,TextInputType.text,emailController),
                  buildTextFormField("Company Name in Arabic",20,TextInputType.text,emailController),
                  buildTextFormField("Web Site",20,TextInputType.text,emailController),
                  buildTextFormField("Company Address",20,TextInputType.text,emailController),
                  buildTextFormField("Employee Number",20,TextInputType.text,emailController),
                  buildTextFormField("Employee Name",20,TextInputType.text,emailController),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Company Logo"),
                      ButtonTheme(
                        minWidth: 20,
                        height: 20,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                            side: BorderSide(color: ColorsProvider().grayColor)
                        ),

                        child: RaisedButton(
                          onPressed: (){},
                          color: ColorsProvider().grayColor,
                          child: Text("UPLOAD",style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Design File"),
                      ButtonTheme(
                        minWidth: 20,
                        height: 20,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                            side: BorderSide(color: ColorsProvider().grayColor)
                        ),

                        child: RaisedButton(
                          onPressed: (){},
                          color: ColorsProvider().grayColor,
                          child: Text("UPLOAD",style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Tax ID"),
                      ButtonTheme(
                        minWidth: 20,
                        height: 20,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                            side: BorderSide(color: ColorsProvider().grayColor)
                        ),

                        child: RaisedButton(
                          onPressed: (){},
                          color: ColorsProvider().grayColor,
                          child: Text("UPLOAD",style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Commercial Number"),
                      ButtonTheme(
                        minWidth: 20,
                        height: 20,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                            side: BorderSide(color: ColorsProvider().grayColor)
                        ),

                        child: RaisedButton(
                          onPressed: (){},
                          color: ColorsProvider().grayColor,
                          child: Text("UPLOAD",style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ButtonTheme(
                        child:  OutlineButton(
                      onPressed: (){},
                           child: Text("Save For Later",style: TextStyle(color: ColorsProvider().primary),),
                           color: ColorsProvider().primary,
                          ),
                      ),
                      SizedBox(width: 30,),
                      ButtonTheme(
                        child: RaisedButton(
                          onPressed: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context) => SecondContranctPage()));

                          },
                          child: Text("Next",style: TextStyle(color: Colors.white),),
                          color: ColorsProvider().primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
