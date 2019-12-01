import 'package:flutter/material.dart';
import 'package:hr/Screens/HR/ContractHistory.dart';
import 'package:hr/Screens/HR/LoginPage.dart';
import 'package:hr/Screens/HR/NewContranctPage.dart';
import 'package:hr/Screens/HR/ProfilePage.dart';
import 'package:hr/Screens/HR/Salary.dart';

import 'customIcons.dart';
Widget mainDrawer(BuildContext context, String title){
  return Container(
    width: MediaQuery.of(context).size.width *0.60,
    child: Drawer(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                CircleAvatar(
                  radius: 70,
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage("https://cdn0.iconfinder.com/data/icons/avatars-6/500/Avatar_boy_man_people_account_client_male_person_user_work_sport_beard_team_glasses-512.png"),
                   ),
                SizedBox(height: 10,),
                Text("Ahmed Mahmoud",style: TextStyle(color: Colors.black),),
              ],
            ),
            SizedBox(height: 30,),
            InkWell(
              child: Row(
                children: <Widget>[
                  Icon(HRIcons.user__1_),
                  SizedBox(width: 20,),
                  Text("Profile"),
                ],
              ),
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) =>ProfilePage()));

              },
            ),
            Divider(thickness: 2,color: Colors.grey,),
            InkWell(
              child: Row(
                children: <Widget>[
                  Icon(HRIcons.path_10958),
                  SizedBox(width: 20,),
                  Text("New Contract"),
                ],
              ),
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) =>NewContranctPage()));
              },
            ),
            Divider(thickness: 2,color: Colors.grey,),
            InkWell(
              child: Row(
                children: <Widget>[
                  Icon(HRIcons.contract),
                  SizedBox(width: 20,),
                  Text("Contract History"),
                ],
              ),
              onTap: (){
               Navigator.push(context,MaterialPageRoute(builder: (context) =>ContractHistory()));
              },
            ),
            Divider(thickness: 2,color: Colors.grey,),
            InkWell(
              child: Row(
                children: <Widget>[
                  Icon(HRIcons.salary),
                  SizedBox(width: 20,),
                  Text("Salary"),
                ],
              ),
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) =>SalaryPage()));
              },
            ),
            Divider(thickness: 2,color: Colors.grey,),
            InkWell(
              child: Row(
                children: <Widget>[
                  Icon(HRIcons.logout),
                  SizedBox(width: 20,),
                  Text("Logo Out"),
                ],
              ),
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) =>LoginPage()));
              },
            ),
          ],
        ),
      ),
    ),
  );
}