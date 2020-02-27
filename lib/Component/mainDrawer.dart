import 'package:flutter/material.dart';
import 'package:hr/Screens/HR/ContractHistory.dart';
import 'package:hr/Screens/HR/NewContranctPage.dart';
import 'package:hr/Screens/HR/ProfilePage.dart';
import 'package:hr/Screens/HR/Salary.dart';
import 'TextFormInput.dart';
import 'customIcons.dart';
double spaces=5.0;
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
                  backgroundColor: Colors.transparent,
                  child: FadeInImage.assetNetwork(
                    image: "https://cdn0.iconfinder.com/data/icons/avatars-6/500/Avatar_boy_man_people_account_client_male_person_user_work_sport_beard_team_glasses-512.png",
                    placeholder: "lib/assets/images/user.png",
                  ),
                ),
                SizedBox(height: 10,),
                Text("Ahmed Mahmoud",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
              ],
            ),
            SizedBox(height: 30,),
            InkWell(
              child: Row(
                children: <Widget>[
                  Icon(HRIcons.user__1_),
                  SizedBox(width: 20,),
                  Text("Profile",style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              ),
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) =>ProfilePage()));
              },
            ),
            SizedBox(height: spaces,),
            Divider(thickness: 2,color: Colors.grey,),
            InkWell(
              child: Row(
                children: <Widget>[
                  Icon(HRIcons.path_10958),
                  SizedBox(width: 20,),
                  Text("New Contract",style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              ),
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) =>NewContranctPage()));
              },
            ),
            SizedBox(height: spaces,),
            Divider(thickness: 2,color: Colors.grey,),
            InkWell(
              child: Row(
                children: <Widget>[
                  Icon(HRIcons.contract),
                  SizedBox(width: 20,),
                  Text("Contract History",style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              ),
              onTap: (){
               Navigator.push(context,MaterialPageRoute(builder: (context) =>ContractHistory()));
              },
            ),
            SizedBox(height: spaces,),
            Divider(thickness: 2,color: Colors.grey,),
            InkWell(
              child: Row(
                children: <Widget>[
                  Icon(HRIcons.salary),
                  SizedBox(width: 20,),
                  Text("Salary",style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              ),
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) =>SalaryPage()));
              },
            ),
            SizedBox(height: spaces,),
            Divider(thickness: 2,color: Colors.grey,),
            InkWell(
              child: Row(
                children: <Widget>[
                  Icon(HRIcons.logout),
                  SizedBox(width: 20,),
                  Text("Logo Out",style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              ),
              onTap: (){
                alertLogOut(context);
              },
            ),
          ],
        ),
      ),
    ),
  );
}
