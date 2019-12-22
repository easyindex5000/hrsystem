import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
String baseUrl = "https://hr.forallw.com/public/";
String api="api/v1";
String loginUrl=baseUrl+api+"/auth/login";
String salaryUrl=baseUrl+api+"/employee/salary";
String profileUrl=baseUrl+api+"/employee/profile";
class HrProvider with ChangeNotifier {
  bool securePassword = true;
  Response response;
  Dio dio = new Dio();
  set setPassword(bool check) {securePassword = check;notifyListeners();}
  //////////////////////////////////////////////////auth//////////////
  Future login(String email,String password) async {
    try {
      response = await dio.post(loginUrl,data: {"email": email,"password": password},);
      return response.data;
    } catch (e) {
      print(e);
    }
  }
  Future salary()async{
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var userToken = prefs.getString('userToken');
      final headers = {'Content-Type': 'application/json', 'Authorization': "Bearer $userToken"};
      response = await dio.get(salaryUrl,options: Options(contentType:Headers.contentEncodingHeader,headers: headers));
      print("response ${response.data.toString()}");
      return response.data;
    } catch (e) {
      print(e);
    }
  }
  Future getProfile()async{
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var userToken = prefs.getString('userToken');
      final headers = {'Content-Type': 'application/json', 'Authorization': "Bearer $userToken"};
      response = await dio.get(profileUrl,options: Options(contentType:Headers.contentEncodingHeader,headers: headers));
      print("response ${response.data.toString()}");
      return response.data;
    } catch (e) {
      print(e);
    }
  }
}