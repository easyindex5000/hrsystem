import 'package:flutter/material.dart';
import 'package:hr/Provider/Colors.dart';
TextFormField buildTextFormField(String labelText,int inputLength,TextInputType type,
    TextEditingController customController,[bool enabled,IconData customIcon,FormFieldValidator validatation]) {
  return TextFormField(
    decoration: InputDecoration(
        labelText: labelText,
         counterText: "",
      suffixIcon: Icon(customIcon)
    ),
    maxLength: inputLength,
    keyboardType: type,
    controller: customController,
    enabled: enabled,
    validator: validatation,
  );
}
AppBar buildAppBar(String title) {
  return AppBar(
    elevation: 0,
    title: Text(title, style: TextStyle(color: ColorsProvider().primary,),),backgroundColor: Colors.white,iconTheme: IconThemeData(color: ColorsProvider().primary),);
}
DropdownButton<String> buildDropdownButton(List<String> myList,Function onChange,dropdownValue) {
  return DropdownButton<String>(
    value: dropdownValue,
    hint: Text("Select"),
    isExpanded: true,
    icon: Icon(Icons.keyboard_arrow_down),
    iconSize: 24,
    elevation: 16,
    style: TextStyle(
        color: Colors.grey[600]
    ),
    underline: Container(
      height: 1,
      color: Colors.grey[600],
    ),
    onChanged:onChange,
    items: myList
        .map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),);
}