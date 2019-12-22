import 'package:flutter/material.dart';
import 'package:hr/Component/TextFormInput.dart';
import 'package:hr/Provider/HRProvider.dart';
class SalaryPage extends StatefulWidget {
  @override
  _SalaryPageState createState() => _SalaryPageState();
}

class _SalaryPageState extends State<SalaryPage> {
  double spaces=25;
  String salary="Basic Salary",commission="Commisions",overtime="Over Time",total="Total";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar("SALARY"),
      body: FutureBuilder(
        future:HrProvider().salary().then((res){
          salary= res["data"]["salary"].toString();
          commission= res["data"]["commission"];
          overtime= res["data"]["overtime"].toString();
          total=res["data"]["total"].toString();
        }),
        builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.done){
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
                    ),
                    SizedBox(height: spaces,),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "$overtime",
                          enabled: false
                      ),
                      enabled: false,
                    ),
                    SizedBox(height: spaces,),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "$total",
                          enabled: false
                      ),
                      enabled: false,
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
