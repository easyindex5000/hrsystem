import 'package:flutter/material.dart';
import 'package:hr/Component/TextFormInput.dart';
class SalaryPage extends StatefulWidget {
  @override
  _SalaryPageState createState() => _SalaryPageState();
}

class _SalaryPageState extends State<SalaryPage> {
  double spaces=25;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar("SALARY"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Basic Salary",
                  ),
                  enabled: false,
                ),
                SizedBox(height: spaces,),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Commisions",
                    enabled: false
                  ),
                  enabled: false,
                ),
                SizedBox(height: spaces,),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Over Time",
                    enabled: false
                  ),
                  enabled: false,
                ),
                SizedBox(height: spaces,),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Total",
                    enabled: false
                  ),
                  enabled: false,
                ),
              ],
            ),
        ),
      ),
    );
  }
}
