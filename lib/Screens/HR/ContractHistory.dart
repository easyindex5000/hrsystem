import 'package:flutter/material.dart';
import 'package:hr/Component/TextFormInput.dart';
import 'package:hr/Component/customIcons.dart';
import 'package:hr/Provider/Colors.dart';
import 'package:hr/Provider/HRProvider.dart';
import 'package:hr/Screens/HR/NewContranctPage.dart';
import 'package:async/async.dart';
import 'package:provider/provider.dart';

class ContractHistory extends StatefulWidget {
  @override
  _ContractHistoryState createState() => _ContractHistoryState();
}

class _ContractHistoryState extends State<ContractHistory> {
  AsyncMemoizer<Map<String, dynamic>> _memoizer = AsyncMemoizer();
  @override
  Widget build(BuildContext context) {
    HrProvider hrProvider = Provider.of<HrProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar("CONTRACT HISTORY"),
      body: FutureBuilder<Map<String, dynamic>>(future: _memoizer.runOnce(() {
        return hrProvider.getContractHistpry();
      }), builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Container(
                child: Expanded(
                  child: ListView.builder(
                      itemCount:snapshot.data['data'].length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return Container(
                          child: Card(
                            elevation: 3,
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        snapshot.data['data'][index]["employee_name"],
                                        style: TextStyle(
                                            color: ColorsProvider().primary,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                 if(snapshot.data['data'][index]['contract_status']==0)   IconButton(
                                      icon: Icon(HRIcons.edit),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    NewContranctPage()));
                                      },
                                    ),
                                  ],
                                ),
                                Divider(),
                                Container(
                                  height: 60,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16.0, right: 16.0, top: 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        InkWell(
                                          child: Container(
                                            child: Center(
                                                child: Text(
                                              "Show",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                          ),
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        NewContranctPage()));
                                          },
                                        ),
                                        Spacer(),
                                        Container(
                                          width: 1,
                                          height: double.infinity,
                                          color: Colors.grey,
                                        ),
                                        Spacer(),
                                        Container(
                                          child: Row(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8.0),
                                                child: Icon(
                                                  HRIcons.warning_true,
                                                  color: Colors.amber,
                                                ),
                                              ),
                                              Text(
                                                "NOT COMPLETE",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
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
                      }),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
