import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
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
  String dropdownValue;
  var date="1-1-1980";
  @override
  void initState() {
    dropdownValue=null;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar("Form"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            CustomProgressBar(1,1),
           Expanded(
             child: ListView(
               children: <Widget>[
                 buildTextFormField("First Name",30,TextInputType.text,passwordController),
                 buildTextFormField("Middle Name",30,TextInputType.text,passwordController),
                 buildTextFormField("family Name",30,TextInputType.text,passwordController),
                 buildTextFormField("E-Mail",30,TextInputType.text,passwordController),
                 buildDropdownButton(),
                 buildDropdownButton(),
                 buildTextFormField("ID Number",30,TextInputType.number,passwordController),
                 buildTextFormField("Passport Number",30,TextInputType.number,passwordController),
                 InkWell(child: buildTextFormField("$date",30,TextInputType.text,passwordController,false,Icons.today),
                   onTap: (){
                     DatePicker.showDatePicker(context,
                       showTitleActions: true,
                       minTime: DateTime(1980, 1, 1),
                       maxTime: DateTime.now(),
                       onChanged:(data){
                         setState(() {
                           date=data.toIso8601String().split("T00:00:00.000")[0];
                         });
                       },
                       onConfirm: (data){},
                     );
                   },),
                 Row(children: <Widget>[
                   Expanded( flex: 1, child: InkWell(child:CountryCodePicker(initialSelection: 'EG', favorite: ['+2','EG','+966','SAR'],
                   ),),),
                   Expanded(flex: 4, child: buildTextFormField("Phone Number",30,TextInputType.number,passwordController)),
                 ],
                 ),
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
  DropdownButton<String> buildDropdownButton() {
    return DropdownButton<String>(
      value: dropdownValue,hint: Text("hint"),
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
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>['One', 'Two', 'Free', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),);
  }
}
