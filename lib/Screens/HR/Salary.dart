import 'package:flutter/material.dart';
import 'package:hr/Component/TextFormInput.dart';
class SalaryPage extends StatefulWidget {
  @override
  _SalaryPageState createState() => _SalaryPageState();
}

class _SalaryPageState extends State<SalaryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar("SALARY"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: Form(
            child: Column(
              children: <Widget>[
               TextFormField(
                 decoration: InputDecoration(
                   border: OutlineInputBorder(),
                   labelText: "Basic Salary",
                   hintText: "5,000 EGP",
                 ),
               ),
                SizedBox(height: 30,),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Commisions",
                    hintText: "5,000 EGP",
                  ),
                ),
                SizedBox(height: 30,),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Over Time",
                    hintText: "5,000 EGP",
                  ),
                ),
                SizedBox(height: 30,),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Total",
                    hintText: "5,000 EGP",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
