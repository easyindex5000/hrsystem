import 'package:flutter/material.dart';
import 'package:hr/Component/TextFormInput.dart';
import 'package:hr/Provider/HRProvider.dart';
class SalaryPage extends StatefulWidget {
  @override
  _SalaryPageState createState() => _SalaryPageState();
}

class _SalaryPageState extends State<SalaryPage> {
    TextEditingController salaryController = new TextEditingController();
    TextEditingController commissionController = new TextEditingController();
    TextEditingController overtimeController = new TextEditingController();
    TextEditingController totalController = new TextEditingController();
  double spaces=25;
  String salary="Basic Salary",commission="Commisions",overtime="Over Time",total="Total";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar("SALARY"),
      body: FutureBuilder(
        future:HrProvider().salary().then((res){
          salaryController.text= res["data"]["salary"].toString();
          commissionController.text= res["data"]["commission"];
          overtimeController.text= res["data"]["overtime"].toString();
          totalController.text=res["data"]["total"].toString();
        }),
        builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.done&&snapshot.data!=null){
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "$salary",
                      ),
                      enabled: false,
                      controller: salaryController,
                    ),
                    SizedBox(height: spaces,),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "$commission",
                          hintText: "",
                          enabled: false
                      ),
                      enabled: false,
                      controller: commissionController,
                    ),
                    SizedBox(height: spaces,),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "$overtime",
                          enabled: false
                      ),
                      enabled: false,
                      controller: overtimeController,
                    ),
                    SizedBox(height: spaces,),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "$total",
                          enabled: false
                      ),
                      enabled: false,
                      controller: overtimeController,
                    ),
                  ],
                ),
              ),
            );
          }
          else{
            return Center(child: CircularProgressIndicator(),);
          }
        }
      ),
    );
  }
}
