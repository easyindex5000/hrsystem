import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hr/Provider/Colors.dart';
import 'package:image_picker/image_picker.dart';

Future<File> getImageFromCamera() async {
  return await ImagePicker.pickImage(source: ImageSource.camera);
}
Future<File> getImageFromGallery() async {
  return  await ImagePicker.pickImage(source: ImageSource.gallery);
}

Future<File> showAlert(BuildContext context) async {
  return await showModalBottomSheet<File>(
    context: context,
//    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return Container(
        height: 200,
      //  content: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.camera_alt,color: ColorsProvider().primary,size: 35,),
                onPressed: ()async{
                  Navigator.of(context).pop(await getImageFromCamera());
                },
              ),
              IconButton(
                icon: Icon(Icons.image,color: ColorsProvider().primary,size: 35,),
                onPressed: ()async{
                  Navigator.of(context).pop(await getImageFromGallery());
                },
              ),
            ],
          ),
      //  ),
      );
    },
  );
}