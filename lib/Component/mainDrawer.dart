import 'package:flutter/material.dart';
import 'package:hr/Screens/HR/ContractHistory.dart';
import 'package:hr/Screens/HR/NewContranctPage.dart';
import 'package:hr/Screens/HR/ProfilePage.dart';
import 'package:hr/Screens/HR/Salary.dart';
Widget mainDrawer(BuildContext context, String title){
  return Drawer(
    child: ListView(
      children: <Widget>[
        Column(
          children: <Widget>[
            CircleAvatar(
              radius: 70,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage("https://cdn0.iconfinder.com/data/icons/avatars-6/500/Avatar_boy_man_people_account_client_male_person_user_work_sport_beard_team_glasses-512.png"),
               ),
            Text("Ahmed Mahmoud"),
          ],
        ),
        InkWell(
          child: Row(
            children: <Widget>[
              Icon(Icons.account_circle),
              SizedBox(width: 20,),
              Text("Profile"),
            ],
          ),
          onTap: (){
            Navigator.push(context,MaterialPageRoute(builder: (context) =>ProfilePage()));

          },
        ),
        Divider(),
        InkWell(
          child: Row(
            children: <Widget>[
              Icon(Icons.account_circle),
              SizedBox(width: 20,),
              Text("New Contract"),
            ],
          ),
          onTap: (){
            Navigator.push(context,MaterialPageRoute(builder: (context) =>NewContranctPage()));
          },
        ),
        Divider(),
        InkWell(
          child: Row(
            children: <Widget>[
              Icon(Icons.account_circle),
              SizedBox(width: 20,),
              Text("Contract History"),
            ],
          ),
          onTap: (){
           Navigator.push(context,MaterialPageRoute(builder: (context) =>ContractHistory()));
          },
        ),
        Divider(),
        InkWell(
          child: Row(
            children: <Widget>[
              Icon(Icons.account_circle),
              SizedBox(width: 20,),
              Text("Salary"),
            ],
          ),
          onTap: (){
            Navigator.push(context,MaterialPageRoute(builder: (context) =>SalaryPage()));
          },
        ),
        Divider(),
        InkWell(
          child: Row(
            children: <Widget>[
              Icon(Icons.account_circle),
              SizedBox(width: 20,),
              Text("Logo Out"),
            ],
          ),
          onTap: (){},
        ),
      ],
    ),
  );
}