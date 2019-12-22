import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:hr/Models/Contract.dart';
import 'dart:io';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

final String baseUrl = "https://hr.forallw.com/public/api/v1/";
String loginUrl = baseUrl + "";
final String _contractStepOneUrl = baseUrl + "contract/new";
final String _contractStepTwoUrl = baseUrl + "contract/";

final String _contractTypesUrl = baseUrl + "contract/types";
final String _contractsHistory = baseUrl + "employee/contracts/history";


class HrProvider with ChangeNotifier {
  bool securePassword = true;
  Response response;
  Dio dio = new Dio();
  set setPassword(bool check) {
    securePassword = check;
    notifyListeners();
  }

  Future getHttp() async {
    try {
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': "Bearer "
      };
      response = await dio.post("/test",
          data: {"id": 12, "name": "wendu"},
          options: Options(
              contentType: Headers.contentEncodingHeader, headers: headers));
      return response.data.toString();
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
      String token =
          "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvaHIuZm9yYWxsdy5jb21cL3B1YmxpY1wvYXBpXC92MVwvYXV0aFwvbG9naW4iLCJpYXQiOjE1NzcwMDU5NzgsImV4cCI6MTU3NzAwOTU3OCwibmJmIjoxNTc3MDA1OTc4LCJqdGkiOiJOb3FCTEJobHBaWlVIQm13Iiwic3ViIjozLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.5adEbkWhALFbqMU0_mVQdGBJ-HjQ0WsS4c1dBB7VEfk";
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
      String token =
          "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvaHIuZm9yYWxsdy5jb21cL3B1YmxpY1wvYXBpXC92MVwvYXV0aFwvbG9naW4iLCJpYXQiOjE1NzcwMDU5NzgsImV4cCI6MTU3NzAwOTU3OCwibmJmIjoxNTc3MDA1OTc4LCJqdGkiOiJOb3FCTEJobHBaWlVIQm13Iiwic3ViIjozLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.5adEbkWhALFbqMU0_mVQdGBJ-HjQ0WsS4c1dBB7VEfk";
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
      String token =
          "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvaHIuZm9yYWxsdy5jb21cL3B1YmxpY1wvYXBpXC92MVwvYXV0aFwvbG9naW4iLCJpYXQiOjE1NzcwMDU5NzgsImV4cCI6MTU3NzAwOTU3OCwibmJmIjoxNTc3MDA1OTc4LCJqdGkiOiJOb3FCTEJobHBaWlVIQm13Iiwic3ViIjozLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.5adEbkWhALFbqMU0_mVQdGBJ-HjQ0WsS4c1dBB7VEfk";
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
      String token =
          "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvaHIuZm9yYWxsdy5jb21cL3B1YmxpY1wvYXBpXC92MVwvYXV0aFwvbG9naW4iLCJpYXQiOjE1NzcwMDU5NzgsImV4cCI6MTU3NzAwOTU3OCwibmJmIjoxNTc3MDA1OTc4LCJqdGkiOiJOb3FCTEJobHBaWlVIQm13Iiwic3ViIjozLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.5adEbkWhALFbqMU0_mVQdGBJ-HjQ0WsS4c1dBB7VEfk";
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
