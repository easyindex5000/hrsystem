import 'dart:io';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:hr/Component/Citys.dart';
import 'package:hr/Component/CustomImagePicker.dart';
import 'package:hr/Component/TextFormInput.dart';
import 'package:hr/Provider/Colors.dart';
import 'package:hr/Provider/HRProvider.dart';
import 'package:hr/Screens/HR/Home%20HR.dart';
import 'package:hr/model/userModel.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController fNameController = new TextEditingController();
  TextEditingController lNameController = new TextEditingController();
  TextEditingController mNameController = new TextEditingController();
  TextEditingController iDNumberController = new TextEditingController();
  TextEditingController phoneNumberController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController idNumberController = new TextEditingController();
  TextEditingController passportNumberController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController dateController = new TextEditingController();
  TextEditingController collageMajorController = new TextEditingController();
  TextEditingController gpaController = new TextEditingController();
  TextEditingController jobTitleController = new TextEditingController();
  TextEditingController companyNameController = new TextEditingController();
  TextEditingController bankController = new TextEditingController();
  TextEditingController accountNumberController = new TextEditingController();
  TextEditingController ibaNNumberController = new TextEditingController();
  TextEditingController startDateController = new TextEditingController();
  TextEditingController endDateController = new TextEditingController();
  TextEditingController nationalityController = new TextEditingController();
  String dropdownValue = City.cities[0].keys.elementAt(0);
  String dropdownValue2;
  final _formKey = GlobalKey<FormState>();
  var date = "1980-1-1";
  File _image, userId, cv, certification;
  String userIdString = "ID.Jpg",
      cvString = "Ahmed.pdf",
      certificationString = "Certification";
  int selectedRadio = 0;
  int selectedRadio2 = 0;
  List<String> city = [];
  @override
  void initState() {
    dropdownValue2 = City.cities[0][dropdownValue].elementAt(0);
    //looping in class and add data  to list
    for (int i = 0; i < City.cities.length; i++) {
      city.addAll(City.cities[0].keys);
    }
    super.initState();
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  setSelectedRadio2(int val) {
    setState(() {
      selectedRadio2 = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar("Profile"),
      body: FutureBuilder(
          future: HrProvider().getProfile().then((res) {
            fNameController.text = res['data']['first_name'];
            mNameController.text = res['data']['mid_name'];
            lNameController.text = res['data']['family_name'];
            emailController.text = res['data']['email'];
            idNumberController.text = res['data']['id_number'];
            passportNumberController.text = res['data']['passport_number'];
            phoneController.text = res['data']['phone_number'].toString();
            collageMajorController.text = res['data']['collage_major'];
            gpaController.text = res['data']['gpa'].toString();
            jobTitleController.text = res['data']['last_job_title'];
            companyNameController.text = res['data']['company_name'];
            startDateController.text = res['data']['start_date'];
            endDateController.text = res['data']['end_data'];
            bankController.text = res['data']['bank_name'];
            accountNumberController.text = res['data']['account_name'];
            ibaNNumberController.text = res['data']['iban_number'];
            date=res['data']['date_of_birth'];
            selectedRadio=res['data']['gender'];
            nationalityController.text=res['data']['nationality'];
          }),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: ListView(
                          children: <Widget>[
                            InkWell(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  _image == null
                                      ? CircleAvatar(
                                          radius: 70,
                                          backgroundColor: Colors.transparent,
                                          child: FadeInImage.assetNetwork(
                                            image:
                                                "https://cdn0.iconfinder.com/data/icons/avatars-6/500/Avatar_boy_man_people_account_client_male_person_user_work_sport_beard_team_glasses-512.png",
                                            placeholder:
                                                "lib/assets/images/user.png",
                                          ),
                                        )
                                      : CircleAvatar(
                                          radius: 70,
                                          backgroundColor: Colors.transparent,
                                          backgroundImage: FileImage(_image),
                                        ),
                                ],
                              ),
                              onTap: () async {
                                _image = await showAlert(context);
                                setState(() {});
                              },
                            ),
                            buildTextFormField(
                                "First Name",
                                20,
                                TextInputType.text,
                                fNameController,
                                true,
                                null,
                                null,
                                null,
                                customValidation),
                            buildTextFormField(
                                "Middle Name",
                                20,
                                TextInputType.text,
                                mNameController,
                                true,
                                null,
                                null,
                                null,
                                customValidation),
                            buildTextFormField(
                                "family Name",
                                20,
                                TextInputType.text,
                                lNameController,
                                true,
                                null,
                                null,
                                null,
                                customValidation),
                            buildTextFormField(
                                "E-Mail",
                                40,
                                TextInputType.emailAddress,
                                emailController,
                                true,
                                null,
                                null,
                                null,
                                customValidation),
                            buildDropdownButton(city, (String newValue) {
                              setState(() {
                                dropdownValue = newValue;
                                dropdownValue2 = null;
                              });
                            }, dropdownValue),
                            buildDropdownButton(City.cities[0][dropdownValue],
                                (String newValue) {
                              setState(
                                () {
                                  dropdownValue2 = newValue;
                                },
                              );
                            }, dropdownValue2),
                                buildTextFormField(
                                "nationality",
                                20,
                                TextInputType.text,
                                nationalityController,
                                true,
                                null,
                                null,
                                null,
                                customValidation),
                            buildTextFormField(
                                "ID Number",
                                20,
                                TextInputType.number,
                                idNumberController,
                                true,
                                null,
                                null,
                                null,
                                customValidation),
                            buildTextFormField(
                                "Passport Number",
                                20,
                                TextInputType.number,
                                passportNumberController,
                                true,
                                null,
                                null,
                                null,
                                customValidation),
                            InkWell(
                              child: buildTextFormField(
                                  "$date",
                                  20,
                                  TextInputType.text,
                                  dateController,
                                  false,
                                  Icons.today),
                              onTap: () {
                                DatePicker.showDatePicker(
                                  context,
                                  showTitleActions: true,
                                  minTime: DateTime(1980, 1, 1),
                                  maxTime: DateTime.now(),
                                  onChanged: (data) {
                                    setState(() {
                                      date = data
                                          .toIso8601String()
                                          .split("T00:00:00.000")[0];
                                    });
                                  },
                                  onConfirm: (data) {},
                                );
                              },
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: InkWell(
                                    child: CountryCodePicker(
                                      // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                      initialSelection: 'EG',
                                      favorite: ['+2', 'EG', '+966', 'SAR'],
                                      // optional. Shows only country name and flag
                                      showCountryOnly: false,
                                      // optional. Shows only country name and flag when popup is closed.
                                      //   showOnlyCountryCodeWhenClosed: false,
                                      // optional. aligns the flag and the Text left
                                      alignLeft: false,
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
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Gender",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: <Widget>[
                                Radio(
                                  value: 0,
                                  groupValue: selectedRadio,
                                  activeColor: ColorsProvider().primary,
                                  onChanged: (value) {
                                    setSelectedRadio(value);
                                  },
                                ),
                                Text("Male"),
                                SizedBox(
                                  width: 20,
                                ),
                                Radio(
                                  value: 1,
                                  groupValue: selectedRadio,
                                  activeColor: ColorsProvider().primary,
                                  onChanged: (value) {
                                    setSelectedRadio(value);
                                  },
                                ),
                                Text("Famle"),
                              ],
                            ),
                            Text(
                              "Marital Status:",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: <Widget>[
                                Radio(
                                  value: 0,
                                  groupValue: selectedRadio2,
                                  activeColor: ColorsProvider().primary,
                                  onChanged: (value) {
                                    setSelectedRadio2(value);
                                  },
                                ),
                                Text("Single"),
                                SizedBox(
                                  width: 12,
                                ),
                                Radio(
                                  value: 1,
                                  groupValue: selectedRadio2,
                                  activeColor: ColorsProvider().primary,
                                  onChanged: (value) {
                                    setSelectedRadio2(value);
                                  },
                                ),
                                Text("Married"),
                              ],
                            ),
                            buildTextFormField(
                                "Collage Major",
                                30,
                                TextInputType.text,
                                collageMajorController,
                                true,
                                null,
                                null,
                                null,
                                customValidation),
                            buildTextFormField(
                                "GPA",
                                20,
                                TextInputType.text,
                                gpaController,
                                true,
                                null,
                                null,
                                null,
                                customValidation),
                            buildTextFormField(
                                "Last Job Title",
                                25,
                                TextInputType.text,
                                jobTitleController,
                                true,
                                null,
                                null,
                                null,
                                customValidation),
                            buildTextFormField(
                                "Company Name",
                                30,
                                TextInputType.text,
                                companyNameController,
                                true,
                                null,
                                null,
                                null,
                                customValidation),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 4,
                                  child: buildTextFormField(
                                      "Start Date",
                                      7,
                                      TextInputType.number,
                                      startDateController,
                                      true,
                                      null,
                                      "10/2019",
                                      null,
                                      customValidation),
                                ),
                                Spacer(
                                  flex: 1,
                                ),
                                Expanded(
                                  flex: 4,
                                  child: buildTextFormField(
                                      "End Date",
                                      7,
                                      TextInputType.number,
                                      endDateController,
                                      null,
                                      null,
                                      "10/2020",
                                      null,
                                      customValidation),
                                )
                              ],
                            ),
                            buildTextFormField(
                                "Bank Name",
                                20,
                                TextInputType.text,
                                bankController,
                                true,
                                null,
                                null,
                                null,
                                customValidation),
                            buildTextFormField(
                                "Account Number",
                                20,
                                TextInputType.number,
                                accountNumberController,
                                true,
                                null,
                                null,
                                null,
                                customValidation),
                            buildTextFormField(
                                "iban Number",
                                20,
                                TextInputType.number,
                                ibaNNumberController,
                                true,
                                null,
                                null,
                                null,
                                customValidation),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("$userIdString"),
                                ButtonTheme(
                                  minWidth: 20,
                                  height: 20,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(18.0),
                                      side: BorderSide(
                                          color: ColorsProvider().grayColor)),
                                  child: RaisedButton(
                                    onPressed: () async {
                                      // ignore: missing_return
                                      userId =
                                          await showAlert(context).then((res) {
                                        userIdString = res.path.substring(
                                            res.path.lastIndexOf("/") + 1);
                                      });
                                      setState(() {});
                                    },
                                    color: ColorsProvider().grayColor,
                                    child: Text(
                                      "CHANGE",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("$certificationString"),
                                ButtonTheme(
                                  minWidth: 20,
                                  height: 20,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(18.0),
                                      side: BorderSide(
                                          color: ColorsProvider().grayColor)),
                                  child: RaisedButton(
                                    onPressed: () async {
                                      // ignore: missing_return
                                      certification =
                                          await showAlert(context).then((res) {
                                        certificationString = res.path
                                            .substring(
                                                res.path.lastIndexOf("/") + 1);
                                      });
                                      setState(() {});
                                    },
                                    color: ColorsProvider().grayColor,
                                    child: Text(
                                      "CHANGE",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("$cvString"),
                                ButtonTheme(
                                  minWidth: 20,
                                  height: 20,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(18.0),
                                      side: BorderSide(
                                          color: ColorsProvider().grayColor)),
                                  child: RaisedButton(
                                    onPressed: () async {
                                      // ignore: missing_return
                                      cv = await FilePicker.getFile(
                                              type: FileType.CUSTOM,
                                              fileExtension: "pdf")
                                          .then((res) {
                                        cvString = res.path.substring(
                                            res.path.lastIndexOf("/") + 1);
                                      });
                                      setState(() {});
                                    },
                                    color: ColorsProvider().grayColor,
                                    child: Text(
                                      "CHANGE",
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
                                  minWidth:
                                      MediaQuery.of(context).size.width / 1.2,
                                  height: 45,
                                  child: Consumer<HrProvider>(
                                    builder: (context,hrProvider,_) {
                                      return RaisedButton(
                                        onPressed: () {
                                          hrProvider.editProfile(
                                            UserData(
                                            
                                            )
                                          );
                                          if (_formKey.currentState.validate()) {

                                            Navigator.push(context,MaterialPageRoute(builder: (context) =>HomeScreen()));
                                          }
                                        },
                                        color: ColorsProvider().primary,
                                        child: Text(
                                          "Save",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      );
                                    }
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
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  String customValidation(dynamic value) {
    if (value.isEmpty
        //   || !RegExp("^[0-9]{3}").hasMatch(value)
        ) {
      return 'this filed is required';
    }
    return null;
  }
}
