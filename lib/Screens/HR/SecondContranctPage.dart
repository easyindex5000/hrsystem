import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hr/Component/TextFormInput.dart';
import 'package:hr/Component/customProgress.dart';
import 'package:hr/Provider/Colors.dart';
import 'package:hr/Provider/HRProvider.dart';
import 'package:hr/Screens/HR/Home%20HR.dart';
import 'package:provider/provider.dart';

class SecondContranctPage extends StatefulWidget {
  final id;

  const SecondContranctPage({Key key, this.id}) : super(key: key);
  @override
  _SecondContranctPageState createState() => _SecondContranctPageState();
}

class _SecondContranctPageState extends State<SecondContranctPage> {
  TextEditingController descriptionEController = new TextEditingController(),
      descriptionAController = new TextEditingController(),
      keyWordsController = new TextEditingController(),
      jobsController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar("New Contract"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              CustomProgressBar(2, 2),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    buildTextFormField(
                        "AD Description in English",
                        30,
                        TextInputType.text,
                        descriptionEController,
                        true,
                        null,
                        null,
                        null,
                        customValidation),
                    buildTextFormField(
                        "AD Description in Arabic",
                        30,
                        TextInputType.text,
                        descriptionAController,
                        true,
                        null,
                        null,
                        TextDirection.rtl,
                        customValidation),
                    buildTextFormField(
                        "Key Words",
                        30,
                        TextInputType.text,
                        keyWordsController,
                        true,
                        null,
                        null,
                        null,
                        customValidation),
                    buildTextFormField(
                        "Available Jobs",
                        30,
                        TextInputType.text,
                        jobsController,
                        true,
                        null,
                        null,
                        null,
                        customValidation),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            ButtonTheme(
              minWidth: MediaQuery.of(context).size.width / 2.8,
              child: OutlineButton(
                child: Text(
                  "Save For Later",
                  style: TextStyle(color: ColorsProvider().primary),
                ),
                onPressed: () {},
                color: ColorsProvider().primary,
              ),
            ),
            ButtonTheme(
              minWidth: MediaQuery.of(context).size.width / 2.8,
              child: RaisedButton(
                child: Text(
                  "Sumbit",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    HrProvider hrProvider = Provider.of<HrProvider>(context);
                    await hrProvider.createContractStepTwo(widget.id,
                        adDesArbic: descriptionAController.text,
                        adDesEnglish: descriptionEController.text,
                        availaveJobs: jobsController.text,
                        keyWords: keyWordsController.text);
                    await showAlertDialog();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => HomeScreen()));
                  }
                },
                color: ColorsProvider().primary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> showAlertDialog() async {
    Timer.periodic(Duration(milliseconds: 900), (Timer timer) {
      timer.cancel();
      Navigator.of(context).pop();
    });
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Contract is added successful',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: ColorsProvider().primary,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }

  String customValidation(dynamic value) {
    if (value.isEmpty) {
      return 'this filed is required';
    }
    return null;
  }
}
