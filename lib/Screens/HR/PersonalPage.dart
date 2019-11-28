import 'package:flutter/material.dart';
import 'package:hr/Component/TextFormInput.dart';
import 'package:hr/Component/customProgress.dart';
import 'package:hr/Provider/Colors.dart';

import 'ExperiencesPage.dart';
class PersonalPage extends StatefulWidget {
  @override
  _PersonalPageState createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
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
            CustomProgressBar(1),
           Expanded(
             child: ListView(
               children: <Widget>[
                 buildTextFormField("First Name",30,TextInputType.text,passwordController),
                 buildTextFormField("Middle Name",30,TextInputType.text,passwordController),
                 buildTextFormField("family Name",30,TextInputType.text,passwordController),
                 buildTextFormField("E-Mail",30,TextInputType.text,passwordController),
                 buildTextFormField("Nationality",30,TextInputType.text,passwordController),
                 buildTextFormField("Country",30,TextInputType.text,passwordController),
                 buildTextFormField("ID Number",30,TextInputType.text,passwordController),
                 buildTextFormField("Passport Number",30,TextInputType.text,passwordController),
                 buildTextFormField("Date of birth",30,TextInputType.text,passwordController),
                 buildTextFormField("Phone Number",30,TextInputType.text,passwordController),
                 Text("Gender"),
                 Row(
                   children: <Widget>[
                     Checkbox(
                       value: false,
                       onChanged: (bool value){
                         setState(() {
                           //false=value
                         });
                       },
                     ),
                     Text("Male"),
                     SizedBox(width: 20,),
                     Checkbox(
                       value: false,
                       onChanged: (bool value){
                         setState(() {
                           //false=value
                         });
                       },
                     ),
                     Text("Famle"),
                   ],
                 ),
                 Row(
                   children: <Widget>[
                     Checkbox(
                       value: false,
                       onChanged: (bool value){
                         setState(() {
                           //false=value
                         });
                       },
                     ),
                     Text("Single"),
                     SizedBox(width: 12,),
                     Checkbox(
                       value: false,
                       onChanged: (bool value){
                         setState(() {
                           //false=value
                         });
                       },
                     ),
                     Text("Married"),
                   ],
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: <Widget>[
                     Text("Personal Photo"),
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
                         child: Text("Upload",style: TextStyle(color: Colors.white),),
                       ),
                     ),
                   ],
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: <Widget>[
                     Text("Personal Photo"),
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
                         child: Text("ID Photo",style: TextStyle(color: Colors.white),),
                       ),
                     ),
                   ],
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                   ButtonTheme(
                     minWidth: MediaQuery.of(context).size.width /1.2,
                     height: 45,
                     child: RaisedButton(
                       onPressed: (){
                         Navigator.push(context,MaterialPageRoute(builder: (context) => ExperiencesPage()));
                       },
                       color: ColorsProvider().primary,
                       child: Text("NEXT",style: TextStyle(color: Colors.white),),
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
