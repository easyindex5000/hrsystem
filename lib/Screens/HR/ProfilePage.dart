import 'dart:io';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:hr/Component/CustomImagePicker.dart';
import 'package:hr/Component/TextFormInput.dart';
import 'package:hr/Provider/Colors.dart';
import 'package:hr/Screens/HR/Home%20HR.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController
  fNameController,lNameController,mNameController,iDNumberController,
  phoneNumberController,emailController,idNumberController,passportNumberController,
  phoneController,dateController,passwordController,collageMajorController,
  gpaController,jobTitleController,companyNameController,bankController,
  accountNumberController,ibaNNumberController = new TextEditingController();
  String dropdownValue;
  final _formKey = GlobalKey<FormState>();
  var date="1980-1-1";
  File _image;
  @override
  void initState() {
    dropdownValue=null;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar("Profile"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key:_formKey,
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: <Widget>[
                    InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          _image == null?
                          CircleAvatar(
                            radius: 70,
                            backgroundColor: Colors.blue,
                            backgroundImage: NetworkImage("https://cdn0.iconfinder.com/data/icons/avatars-6/500/Avatar_boy_man_people_account_client_male_person_user_work_sport_beard_team_glasses-512.png"),
                          ):
                          CircleAvatar(
                            radius: 70,
                            backgroundColor: Colors.blue,
                            backgroundImage: FileImage(_image),
                          ),
                        ],
                      ),
                      onTap: ()async{
                         _image=await showAlert(context);
                         setState(() {});
                      },
                    ),
                    buildTextFormField("First Name",30,TextInputType.text,fNameController),
                    buildTextFormField("Middle Name",30,TextInputType.text,mNameController),
                    buildTextFormField("family Name",30,TextInputType.text,lNameController),
                    buildTextFormField("E-Mail",30,TextInputType.emailAddress,emailController),
                    buildDropdownButton(),
                    buildDropdownButton(),
                    buildTextFormField("ID Number",30,TextInputType.number,idNumberController),
                    buildTextFormField("Passport Number",30,TextInputType.number,passportNumberController),
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
                    Row(
                      children: <Widget>[
                        Expanded( flex: 1, child: InkWell(child:
                        CountryCodePicker(
                          // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                        initialSelection: 'EG',
                          favorite: ['+2','EG','+966','SAR'],
                          // optional. Shows only country name and flag
                          showCountryOnly: false,
                          // optional. Shows only country name and flag when popup is closed.
                          //   showOnlyCountryCodeWhenClosed: false,
                          // optional. aligns the flag and the Text left
                          alignLeft: false,

                        ),
                        ),
                        ),
                        Expanded(flex: 4, child: buildTextFormField(" Phone Number",30,TextInputType.number,phoneController)),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Text("Gender",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
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
                    Text("Marital Status:",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
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
                    buildTextFormField("Collage Major",30,TextInputType.text,collageMajorController),
                    buildTextFormField("GPA",30,TextInputType.text,gpaController),
                    buildTextFormField("Last Job Title",30,TextInputType.text,jobTitleController),
                    buildTextFormField("Company Name",30,TextInputType.text,companyNameController),
                 Row(
                   children: <Widget>[
                     Expanded(flex: 4,
                       child:buildTextFormField("Start Date",4,TextInputType.text,passwordController),
                     ),
                     Spacer(flex: 1,),
                     Expanded(flex: 4,
                       child:buildTextFormField("End Date",4,TextInputType.text,passwordController),
                     )
                   ],
                 ),
                    buildTextFormField("Bank Name",30,TextInputType.text,bankController),
                    buildTextFormField("Account Number",30,TextInputType.text,accountNumberController),
                    buildTextFormField("iban Number",30,TextInputType.text,ibaNNumberController),

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
                            child: Text("Upload",style: TextStyle(color: Colors.white),),
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
                              Navigator.push(context,MaterialPageRoute(builder: (context) => HomeScreen()));
                              //if (_formKey.currentState.validate()){}
                            },
                            color: ColorsProvider().primary,
                            child: Text("Save",style: TextStyle(color: Colors.white),),
                          ),
                        ),
                      ],),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
  DropdownButton<String> buildDropdownButton() {
    return DropdownButton<String>(
      value: dropdownValue,
      hint: Text("hint"),
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
