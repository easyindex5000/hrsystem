import 'dart:io';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:hr/Component/CustomImagePicker.dart';
import 'package:hr/Component/TextFormInput.dart';
import 'package:hr/Component/customProgress.dart';
import 'package:hr/Provider/Colors.dart';
import 'package:hr/Screens/HR/SecondContranctPage.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'dart:async';
class NewContranctPage extends StatefulWidget {
  @override
  _NewContranctPageState createState() => _NewContranctPageState();
}

class _NewContranctPageState extends State<NewContranctPage> {
  TextEditingController companyNameAController,companyNameEController,mobileController,
  phoneController,webSiteController,companyAddressController,employeeNumberController,
  employeeNameController, emailController = new TextEditingController();
  String dropdownValue;
  String company="companyLogo",tax="Tax ID",commercial="Commercial Number";
  File companyLogo,taxId,commercialNumber;
  int imageCounter=0;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    dropdownValue=null;
    super.initState();
  }
  List<Asset> images = List<Asset>();
  String _error = 'No Error Dectected';
  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return AssetThumb(
          asset: asset,
          width: 300,
          height: 300,
        );
      }),
    );
  }
  Future<void> loadAssets() async {
    List<Asset> resultList = List<Asset>();
    String error = 'No Error Dectected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 4,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#003463",
          actionBarTitle: "Upload Image",
          allViewTitle: "Selected Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
      for (var r in resultList) {
        var t = await r.filePath;
        print(t);
      }
    } on Exception catch (e) {
      error = e.toString();
    }
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
      _error = error;
    });
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
                      Text("$company"),
                      ButtonTheme(
                        minWidth: 20,
                        height: 20,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                            side: BorderSide(color: ColorsProvider().grayColor)
                        ),
                        child: RaisedButton(
                          onPressed: ()async{
                            companyLogo=await showAlert(context).then((res){
                              company=res.path.substring(res.path.lastIndexOf("/")+1);
                            });
                            setState(() {});
                          },
                          color: ColorsProvider().grayColor,
                          child: Text("UPLOAD",style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Design File ($imageCounter/4)"),
                      ButtonTheme(
                        minWidth: 20,
                        height: 20,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                            side: BorderSide(color: ColorsProvider().grayColor)
                        ),
                        child: RaisedButton(
                          onPressed: (){
                            loadAssets().then((res){
                              imageCounter=images.length;
                            });
                          },
                          color: ColorsProvider().grayColor,
                          child: Text("UPLOAD",style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("$tax"),
                      ButtonTheme(
                        minWidth: 20,
                        height: 20,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                            side: BorderSide(color: ColorsProvider().grayColor)
                        ),
                        child: RaisedButton(
                          onPressed: ()async{
                            taxId=await showAlert(context).then((res){
                              tax=res.path.substring(res.path.lastIndexOf("/")+1);
                            });setState(() {});
                          },
                          color: ColorsProvider().grayColor,
                          child: Text("UPLOAD",style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("$commercial"),
                      ButtonTheme(
                        minWidth: 20,
                        height: 20,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                            side: BorderSide(color: ColorsProvider().grayColor)
                        ),
                        child: RaisedButton(
                          onPressed: ()async{
                            commercialNumber=await showAlert(context).then((res){
                              commercial=res.path.substring(res.path.lastIndexOf("/")+1);
                            });
                            setState(() {});
                          },
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
                      onPressed: (){

                      },
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
