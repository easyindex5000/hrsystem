import 'package:flutter/material.dart';
import 'package:hr/Component/TextFormInput.dart';
import 'package:hr/Component/customProgress.dart';
import 'package:hr/Provider/Colors.dart';
import 'package:hr/Screens/HR/AccountPage.dart';
class ExperiencesPage extends StatefulWidget {
  @override
  _ExperiencesPageState createState() => _ExperiencesPageState();
}

class _ExperiencesPageState extends State<ExperiencesPage> {
  TextEditingController
  collageController,gpaController,jobController,companyController,passwordController,
  startDateController,endDateController
  = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar("Form"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            CustomProgressBar(2,1),
            Expanded(
              child: ListView(
                children: <Widget>[
                  buildTextFormField("Collage Major",30,TextInputType.text,collageController),
                  buildTextFormField("GPA",30,TextInputType.text,gpaController),
                  buildTextFormField("Last Job Title",30,TextInputType.text,jobController),
                  buildTextFormField("Company Name",30,TextInputType.text,companyController),
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 4,
                        child:buildTextFormField("Start Date",4,TextInputType.number,startDateController),
                      ),
                      Spacer(flex: 1,),
                      Expanded(
                        flex: 4,
                        child:buildTextFormField("End Date",4,TextInputType.number,endDateController),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("CV"),
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
                      Text("Certification"),
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
                            Navigator.push(context,MaterialPageRoute(builder: (context) => AccountPage()));
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
