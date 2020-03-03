import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hr/Provider/Colors.dart';
import 'package:hr/Screens/HR/LoginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
TextFormField buildTextFormField(String labelText,int inputLength,TextInputType type,
    TextEditingController customController,[bool enabled,IconData customIcon,String hintText,TextDirection textDir,FormFieldValidator validatation,int lines]) {
  return TextFormField(
    decoration: InputDecoration(
        labelText: labelText,
         counterText: "",
      hintText: hintText,
      suffixIcon: Icon(customIcon),
    ),
    maxLength: inputLength,
    keyboardType: type,
    controller: customController,
    enabled: enabled,
    textDirection:textDir,
    validator: validatation,
    maxLines: lines,
  );
}
AppBar buildAppBar(String title) {
  return AppBar(
    elevation: 0,
    title: Text(title, style: TextStyle(color: ColorsProvider().primary,),),backgroundColor: Colors.white,iconTheme: IconThemeData(color: ColorsProvider().primary),);
}
DropdownButton<String> buildDropdownButton(List<String> myList,Function onChange,dropdownValue) {
  return DropdownButton<String>(
    value: dropdownValue,
    hint: Text("Select"),
    isExpanded: true,
    icon: Icon(Icons.keyboard_arrow_down),
    iconSize: 24,
    elevation: 16,
    style: TextStyle(
        color: Colors.grey[600]
    ),
    underline: Container(
      height: 1,
      color: Colors.grey[600],
    ),
    onChanged:onChange,
    items: myList
        .map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),);
}
Future<void> alertLogOut(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Are you want to logout',textAlign: TextAlign.center,style: TextStyle(color: ColorsProvider().primary),),
        actions: <Widget>[
          ButtonTheme(
            minWidth: MediaQuery.of(context).size.width /3,
            child: RaisedButton(
              color: Colors.red,
              child: Text("Logout",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                Navigator.of(context).pop(prefs.clear());
                Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (context) => new LoginPage()));
              },
            ),
          ),
          ButtonTheme(
            minWidth: MediaQuery.of(context).size.width /3,
            child: OutlineButton(
              child: Text("Cancel",style: TextStyle(color: Colors.grey),),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
          ),

        ],
      );
    },
  );
}