import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:core';
class User with ChangeNotifier{
  int status;
  bool success;
  Data data;

  User({this.status, this.success, this.data});

  User.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data with ChangeNotifier{
  int id;
  String email;
  String emailVerifiedAt;
  int role;
  String code;
  String firstName;
  String midName;
  String familyName;
  String username;
  String nationality;
  String country;
  String idNumber;
  String passportNumber;
  String dateOfBirth;
  String phoneNumber;
  int gender;
  String maritalStatus;
  String personalPhoto;
  String idPhoto;
  String collageMajor;
  double gpa;
  String lastJobTitle;
  String companyName;
  String startDate;
  String endData;
  String cv;
  String certificate;
  String bankName;
  String accountName;
  String ibanNumber;
  int salary;
  String commission;
  int overtime;
  int isFullTime;
  String createdAt;
  String updatedAt;

  Data(
      {this.id,
        this.email,
        this.emailVerifiedAt,
        this.role,
        this.code,
        this.firstName,
        this.midName,
        this.familyName,
        this.username,
        this.nationality,
        this.country,
        this.idNumber,
        this.passportNumber,
        this.dateOfBirth,
        this.phoneNumber,
        this.gender,
        this.maritalStatus,
        this.personalPhoto,
        this.idPhoto,
        this.collageMajor,
        this.gpa,
        this.lastJobTitle,
        this.companyName,
        this.startDate,
        this.endData,
        this.cv,
        this.certificate,
        this.bankName,
        this.accountName,
        this.ibanNumber,
        this.salary,
        this.commission,
        this.overtime,
        this.isFullTime,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    role = json['role'];
    code = json['code'];
    firstName = json['first_name'];
    midName = json['mid_name'];
    familyName = json['family_name'];
    username = json['username'];
    nationality = json['nationality'];
    country = json['country'];
    idNumber = json['id_number'];
    passportNumber = json['passport_number'];
    dateOfBirth = json['date_of_birth'];
    phoneNumber = json['phone_number'];
    gender = json['gender'];
    maritalStatus = json['marital_status'];
    personalPhoto = json['personal_photo'];
    idPhoto = json['id_photo'];
    collageMajor = json['collage_major'];
    gpa = json['gpa'];
    lastJobTitle = json['last_job_title'];
    companyName = json['company_name'];
    startDate = json['start_date'];
    endData = json['end_data'];
    cv = json['cv'];
    certificate = json['certificate'];
    bankName = json['bank_name'];
    accountName = json['account_name'];
    ibanNumber = json['iban_number'];
    salary = json['salary'];
    commission = json['commission'];
    overtime = json['overtime'];
    isFullTime = json['is_full_time'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['role'] = this.role;
    data['code'] = this.code;
    data['first_name'] = this.firstName;
    data['mid_name'] = this.midName;
    data['family_name'] = this.familyName;
    data['username'] = this.username;
    data['nationality'] = this.nationality;
    data['country'] = this.country;
    data['id_number'] = this.idNumber;
    data['passport_number'] = this.passportNumber;
    data['date_of_birth'] = this.dateOfBirth;
    data['phone_number'] = this.phoneNumber;
    data['gender'] = this.gender;
    data['marital_status'] = this.maritalStatus;
    data['personal_photo'] = this.personalPhoto;
    data['id_photo'] = this.idPhoto;
    data['collage_major'] = this.collageMajor;
    data['gpa'] = this.gpa;
    data['last_job_title'] = this.lastJobTitle;
    data['company_name'] = this.companyName;
    data['start_date'] = this.startDate;
    data['end_data'] = this.endData;
    data['cv'] = this.cv;
    data['certificate'] = this.certificate;
    data['bank_name'] = this.bankName;
    data['account_name'] = this.accountName;
    data['iban_number'] = this.ibanNumber;
    data['salary'] = this.salary;
    data['commission'] = this.commission;
    data['overtime'] = this.overtime;
    data['is_full_time'] = this.isFullTime;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
