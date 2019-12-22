import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:hr/Models/Contract.dart';
import 'dart:io';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:shared_preferences/shared_preferences.dart';

final String _baseUrl = "https://hr.forallw.com/public/";
final String _api = "api/v1";
final String loginUrl = _baseUrl + _api + "/auth/login";
final String salaryUrl = _baseUrl + _api + "/employee/salary";
final String profileUrl = _baseUrl + _api + "/employee/profile";
final String _contractStepOneUrl = _baseUrl + _api + "/contract/new";
final String _contractStepTwoUrl = _baseUrl + _api + "/contract/";
final String _contractTypesUrl = _baseUrl + _api + "/contract/types";
final String _contractsHistory =
    _baseUrl + _api + "/employee/contracts/history";

class HrProvider with ChangeNotifier {
  bool securePassword = true;
  Response response;
  Dio dio = new Dio();
  set setPassword(bool check) {
    securePassword = check;
    notifyListeners();
  }

  //////////////////////////////////////////////////auth//////////////
  Future login(String email, String password) async {
    try {
      print(loginUrl);
      response = await dio.post(
        loginUrl,
        data: {"email": email, "password": password},
      );
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  Future salary() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var userToken = prefs.getString('userToken');
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': "Bearer $userToken"
      };
      response = await dio.get(salaryUrl,
          options: Options(
              contentType: Headers.contentEncodingHeader, headers: headers));
      print("response ${response.data.toString()}");
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  Future getProfile() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var userToken = prefs.getString('userToken');
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': "Bearer $userToken"
      };
      response = await dio.get(profileUrl,
          options: Options(
              contentType: Headers.contentEncodingHeader, headers: headers));
      print("response ${response.data.toString()}");
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  Future createContractStepOne(Contract contract,
      {@required File companyLogo,
      @required Asset designFile,
      @required File taxID,
      @required File commercialNumber}) async {
    print("aaaaaaaaaaaaaaa");
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('userToken');
      final headers = {
        // 'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      };
      companyLogo = await _compressFile(companyLogo);
      taxID = await _compressFile(taxID);
      commercialNumber = await _compressFile(commercialNumber);
      FormData formData = FormData.fromMap(contract.toJson());
      formData.files.add(MapEntry(
          "company_logo",
          await MultipartFile.fromFile(companyLogo.path,
              filename: companyLogo.path)));
      formData.files.add(MapEntry("tax_id_photo",
          await MultipartFile.fromFile(taxID.path, filename: taxID.path)));
      formData.files.add(MapEntry(
          "commercial_id_photo",
          await MultipartFile.fromFile(commercialNumber.path,
              filename: commercialNumber.path)));
      String dir = (await getApplicationDocumentsDirectory()).path;
      final buffer = (await designFile.getByteData()).buffer;
      File f = (await File(dir + "/" + designFile.name).writeAsBytes(
          buffer.asUint8List((await designFile.getByteData()).offsetInBytes,
              (await designFile.getByteData()).lengthInBytes)));
      f = await _compressFile(f);
      formData.files.add(MapEntry("design_file",
          await MultipartFile.fromFile(f.path, filename: f.path)));
      response = await dio.post(_contractStepOneUrl,
          data: formData,
          options: Options(
              contentType: Headers.contentEncodingHeader, headers: headers));
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  Future createContractStepTwo(int id,
      {@required String adDesEnglish,
      @required String adDesArbic,
      @required String keyWords,
      @required String availaveJobs}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('userToken');
      final headers = {
        'Authorization': "Bearer $token",
        'Content-Type': 'application/json',
      };
      response = await dio.post(
          _contractStepTwoUrl + id.toString() + "/complete",
          data: FormData.fromMap({
            "ad_description_en": adDesEnglish,
            "ad_description_ar": adDesArbic,
            "keywords": keyWords,
            "available_job": availaveJobs
          }),
          options: Options(
              contentType: Headers.contentEncodingHeader, headers: headers));
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  Future<Map<String, dynamic>> getContractTypes() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('userToken');
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      };
      response = await dio.get(_contractTypesUrl,
          options: Options(
              contentType: Headers.contentEncodingHeader, headers: headers));
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  Future<Map<String, dynamic>> getContractHistpry() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('userToken');
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      };
      response = await dio.get(_contractsHistory,
          options: Options(
              contentType: Headers.contentEncodingHeader, headers: headers));
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  Future<File> _compressFile(File file) async {
    var result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      file.absolute.path,
      quality: 60,
    );
    if (result.lengthSync() > 1000000) {
      return _compressFile(result);
    }
    return result;
  }
}
