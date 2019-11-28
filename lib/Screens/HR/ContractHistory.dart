import 'package:flutter/material.dart';
import 'package:hr/Component/TextFormInput.dart';
import 'package:hr/Provider/Colors.dart';
class ContractHistory extends StatefulWidget {
  @override
  _ContractHistoryState createState() => _ContractHistoryState();
}

class _ContractHistoryState extends State<ContractHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar("CONTRACT HISTORY"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Container(
              child: Expanded(
                child: ListView.builder(
                  itemCount: 5,
                    itemBuilder: (BuildContext ctxt, int index){
                      return Container(child: Card(
                        elevation: 3,
                        child: Column(
                          children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Ahmed Mahmoud",style: TextStyle(color: ColorsProvider().primary,fontWeight: FontWeight.bold),),
                              ),
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: (){},
                              ),
                            ],
                          ),
                            Divider(),
                            Container(
                              height: 60,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    InkWell(
                                      child: Container(
                                          child: Center(child: Text("Show",style: TextStyle(color: Colors.black),)),
                                      ),
                                      onTap: (){},
                                    ),
                                    Spacer(),
                                    Container(
                                      child: Row(
                                        children: <Widget>[
                                          Icon(Icons.add_alert),
                                          Text("NOT COMPLETE",style: TextStyle(color: Colors.black),),
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                        ],
                        ),
                      ),
                      );
                    }
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
