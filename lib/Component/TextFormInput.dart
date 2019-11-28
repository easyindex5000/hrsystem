import 'package:flutter/material.dart';
import 'package:hr/Provider/Colors.dart';
TextFormField buildTextFormField(String labelText,int inputLength,TextInputType type,TextEditingController customController,[bool autovalidation=false ]) {
  return TextFormField(
    decoration: InputDecoration(
        labelText: labelText,
         counterText: "",
    ),
    maxLength: inputLength,
    keyboardType: type,
    controller: customController,
    autovalidate: autovalidation,
  );
}
AppBar buildAppBar(String title) {
  return AppBar(
    elevation: 0,
    title: Text(title, style: TextStyle(color: ColorsProvider().primary,),),backgroundColor: Colors.white,iconTheme: IconThemeData(color: ColorsProvider().primary),);
}