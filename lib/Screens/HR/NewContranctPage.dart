import 'dart:io';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hr/Component/Citys.dart';
import 'package:hr/Component/CustomImagePicker.dart';
import 'package:hr/Component/TextFormInput.dart';
import 'package:hr/Component/customProgress.dart';
import 'package:hr/Models/Contract.dart';
import 'package:hr/Provider/Colors.dart';
import 'package:hr/Provider/HRProvider.dart';
import 'package:hr/Screens/HR/SecondContranctPage.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'dart:async';

import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:async/async.dart';

class NewContranctPage extends StatefulWidget {
  @override
  _NewContranctPageState createState() => _NewContranctPageState();
}

class _NewContranctPageState extends State<NewContranctPage> {
  TextEditingController companyNameAController = new TextEditingController();
  TextEditingController companyNameEController = new TextEditingController();
  TextEditingController mobileController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController webSiteController = new TextEditingController();
  TextEditingController companyAddressController = new TextEditingController();
  TextEditingController employeeNumberController = new TextEditingController();
  TextEditingController employeeNameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController notesController = new TextEditingController();
  String company = "CompanyLogo",
        tax = "VAT ID",
      commercial = "Commercial Number";
  File companyLogo, taxId, commercialNumber;
  int imageCounter = 0;
  String country = City.cities[0].keys.elementAt(0);

  String city;
  Map<String, dynamic> contract;
  List<String> cities = [];
  // ignore: unused_field
  final _formKey = GlobalKey<FormState>();
  AsyncMemoizer<Map<String, dynamic>> _memorizer = AsyncMemoizer();
  @override
  void initState() {
    city = City.cities[0][country].elementAt(0);
    //looping in class and add data  to list
    for (int i = 0; i < City.cities.length; i++) {
      cities.addAll(City.cities[0].keys);
    }
    super.initState();
  }

  List<Asset> images = List<Asset>();
  // ignore: unused_field
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
        String dir = (await getApplicationDocumentsDirectory()).path;
        final buffer = (await r.getByteData()).buffer;
        File t = (await File(dir + "/" + r.name).writeAsBytes(
            buffer.asUint8List((await r.getByteData()).offsetInBytes,
                (await r.getByteData()).lengthInBytes)));
        print(t.path);
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
    HrProvider hrProvider = Provider.of<HrProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar("New Contract"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              CustomProgressBar(1, 2),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    FutureBuilder<Map<String, dynamic>>(
                        future: _memorizer.runOnce(() {
                      return hrProvider.getContractTypes();
                    }), builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return SizedBox();
                      }
                      print(snapshot.data.runtimeType);
                      List data2 = snapshot.data['data'];
                      var data = data2.cast<Map<String, dynamic>>();
                      return buildDropdownButtonContract(data,
                          (Map<String, dynamic> newValue) {
                        contract = newValue;
                        setState(() {});
                      }, contract);
                    }),
                    buildTextFormField(
                        "Company Name in English",
                        40,
                        TextInputType.text,
                        companyNameEController,
                        true,
                        null,
                        null,
                        null,
                        customValidation),
                    buildTextFormField(
                        "Company Name in Arabic",
                        40,
                        TextInputType.text,
                        companyNameAController,
                        true,
                        null,
                        null,
                        TextDirection.rtl,
                        customValidation),
                    buildDropdownButton(cities, (String newValue) {
                      setState(() {
                        country = newValue;
                        city = null;
                      });
                    }, country),
                    buildDropdownButton(City.cities[0][country],
                        (String newValue) {
                      setState(
                        () {
                          city = newValue;
                        },
                      );
                    }, city),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            child: CountryCodePicker(
                              initialSelection: 'EG',
                              favorite: ['+2', 'EG', '+966', 'SAR'],
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 4,
                            child: buildTextFormField(
                                " Mobile Number",
                                20,
                                TextInputType.number,
                                mobileController,
                                true,
                                null,
                                null,
                                null,
                                customValidation)),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            child: CountryCodePicker(
                              initialSelection: 'EG',
                              favorite: ['+2', 'EG', '+966', 'SAR'],
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 4,
                            child: buildTextFormField(
                                " Phone Number",
                                20,
                                TextInputType.number,
                                phoneController,
                                true,
                                null,
                                null,
                                null,
                                customValidation)),
                      ],
                    ),
                    buildTextFormField(
                        "Web Site",
                        50,
                        TextInputType.text,
                        webSiteController,
                        true,
                        null,
                        null,
                        null,
                        customValidation),
                    buildTextFormField(
                        "Company Address",
                        50,
                        TextInputType.text,
                        companyAddressController,
                        true,
                        null,
                        null,
                        null,
                        customValidation),
                    buildTextFormField(
                        "Employee Number",
                        20,
                        TextInputType.number,
                        employeeNumberController,
                        true,
                        null,
                        null,
                        null,
                        customValidation),
                    buildTextFormField(
                        "Employee Name",
                        30,
                        TextInputType.text,
                        employeeNameController,
                        true,
                        null,
                        null,
                        null,
                        customValidation),
                    buildTextFormField(
                        "Notes",
                        120,
                        TextInputType.text,
                        notesController,
                        true,
                        null,
                        null,
                        null,
                        null,
                          3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("$company"),
                        ButtonTheme(
                          minWidth: 20,
                          height: 20,
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(18.0),
                              side: BorderSide(
                                  color: ColorsProvider().grayColor)),
                          child: RaisedButton(
                            onPressed: () async {
                              // ignore: missing_return

                              await showAlert(context).then((res) {
                                companyLogo = res;

                                company = res.path
                                    .substring(res.path.lastIndexOf("/") + 1);
                              });
                              setState(() {});
                            },
                            color: ColorsProvider().grayColor,
                            child: Text(
                              "UPLOAD",
                              style: TextStyle(color: Colors.white),
                            ),
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
                              side: BorderSide(
                                  color: ColorsProvider().grayColor)),
                          child: RaisedButton(
                            onPressed: () {
                              loadAssets().then((res) {
                                imageCounter = images.length;
                              });
                            },
                            color: ColorsProvider().grayColor,
                            child: Text(
                              "UPLOAD",
                              style: TextStyle(color: Colors.white),
                            ),
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
                              side: BorderSide(
                                  color: ColorsProvider().grayColor)),
                          child: RaisedButton(
                            onPressed: () async {
                              // ignore: missing_return
                              await showAlert(context).then((res) {
                                taxId = res;
                                tax = res.path
                                    .substring(res.path.lastIndexOf("/") + 1);
                              });
                              setState(() {});
                            },
                            color: ColorsProvider().grayColor,
                            child: Text(
                              "UPLOAD",
                              style: TextStyle(color: Colors.white),
                            ),
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
                              side: BorderSide(
                                  color: ColorsProvider().grayColor)),
                          child: RaisedButton(
                            onPressed: () async {
                              // ignore: missing_return

                              await showAlert(context).then((res) {
                                commercialNumber = res;
                                commercial = res.path
                                    .substring(res.path.lastIndexOf("/") + 1);
                              });
                              setState(() {});
                            },
                            color: ColorsProvider().grayColor,
                            child: Text(
                              "UPLOAD",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ButtonTheme(
                          child: OutlineButton(
                            onPressed: () {},
                            child: Text(
                              "Save For Later",
                              style: TextStyle(color: ColorsProvider().primary),
                            ),
                            color: ColorsProvider().primary,
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        ButtonTheme(
                          child: RaisedButton(
                            onPressed: () async {
                              var res =
                                  await HrProvider().createContractStepOne(
                                      Contract(
                                        country: country,
                                        city: city,
                                        companyAddress:
                                            companyAddressController.text,
                                        companyNameAr:
                                            companyNameAController.text,
                                        website: webSiteController.text,
                                        companyNameEn:
                                            companyNameEController.text,
                                        mobileNumber: mobileController.text,
                                        phoneNumber: phoneController.text,
                                        contractTypeId:
                                            contract['id'].toString(),
                                      ),
                                      companyLogo: companyLogo,
                                      commercialNumber: commercialNumber,
                                      designFile: images[0],
                                      taxID: taxId);
                              print("doneeeeee");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SecondContranctPage(
                                            id: res['data']['id'],
                                          )));

                              if (_formKey.currentState.validate()) {}
                            },
                            child: Text(
                              "Next",
                              style: TextStyle(color: Colors.white),
                            ),
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
      ),
    );
  }

  DropdownButton<Map<String, dynamic>> buildDropdownButtonContract(
      List<Map<String, dynamic>> myList, Function onChange, dropdownValue) {
    return DropdownButton<Map<String, dynamic>>(
      value: dropdownValue,
      hint: Text("Select"),
      isExpanded: true,
      icon: Icon(Icons.keyboard_arrow_down),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.grey[600]),
      underline: Container(
        height: 1,
        color: Colors.grey[600],
      ),
      onChanged: onChange,
      items: myList.map<DropdownMenuItem<Map<String, dynamic>>>(
          (Map<String, dynamic> value) {
        return DropdownMenuItem<Map<String, dynamic>>(
          value: value,
          child: Text(value['name']),
        );
      }).toList(),
    );
  }

  String customValidation(dynamic value) {
    if (value.isEmpty) {
      return 'this filed is required';
    }
    return null;
  }
}
