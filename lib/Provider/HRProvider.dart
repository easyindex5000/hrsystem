import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
String baseUrl = "";
String loginUrl=baseUrl+"";
class HrProvider with ChangeNotifier {
  bool securePassword = true;
  Response response;
  Dio dio = new Dio();
  set setPassword(bool check) {securePassword = check;notifyListeners();}
  Future getHttp() async {
    try {
      final headers = {'Content-Type': 'application/json', 'Authorization': "Bearer "};
      response = await dio.post("/test",data: {"id": 12, "name": "wendu"},
      options: Options(contentType:Headers.contentEncodingHeader,headers: headers));
      print(response.data.toString());
      return response.data.toString();
    } catch (e) {
      print(e);
    }
  }
}