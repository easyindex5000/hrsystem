import 'package:flutter/material.dart';
class HrProvider with ChangeNotifier{
 bool securePassword = true;
 set setPassword(bool check) {
   securePassword = check;
   notifyListeners();
 }
}