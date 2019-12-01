import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:hr/Component/TextFormInput.dart';
import 'package:hr/Component/customProgress.dart';
import 'package:hr/Provider/Colors.dart';
import 'package:hr/Screens/HR/SecondContranctPage.dart';
class NewContranctPage extends StatefulWidget {
  @override
  _NewContranctPageState createState() => _NewContranctPageState();
}

class _NewContranctPageState extends State<NewContranctPage> {
  TextEditingController companyNameAController,companyNameEController,mobileController,
  phoneController,webSiteController,companyAddressController,employeeNumberController,
  employeeNameController, emailController = new TextEditingController();
  String dropdownValue;
  @override
  void initState() {
    dropdownValue=null;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:buildAppBar("New Contract") ,
      body:Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            CustomProgressBar(1,2),
            Expanded(
              child: ListView(
                children: <Widget>[
                  buildTextFormField("Company Name in English",20,TextInputType.text,companyNameEController),
                  buildTextFormField("Company Name in Arabic",20,TextInputType.text,companyNameAController),
                  buildDropdownButton(),
                  buildDropdownButton(),
                  buildDropdownButton(),
                  Row(children: <Widget>[
                      Expanded( flex: 1, child: InkWell(child:CountryCodePicker(initialSelection: 'EG', favorite: ['+2','EG','+966','SAR'],
                      ),),),
                      Expanded(flex: 4, child: buildTextFormField(" Mobile Number",30,TextInputType.number,mobileController)),
                    ],
                  ),
                  Row(children: <Widget>[
                      Expanded( flex: 1, child: InkWell(child:CountryCodePicker(initialSelection: 'EG', favorite: ['+2','EG','+966','SAR'],
                      ),),),
                      Expanded(flex: 4, child: buildTextFormField(" Phone Number",30,TextInputType.number,phoneController)),
                    ],
                  ),
                  buildTextFormField("Web Site",20,TextInputType.text,webSiteController),
                  buildTextFormField("Company Address",20,TextInputType.text,companyAddressController),
                  buildTextFormField("Employee Number",20,TextInputType.number,employeeNumberController),
                  buildTextFormField("Employee Name",20,TextInputType.text,employeeNameController),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
