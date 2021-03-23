import 'dart:io';

import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/radio/radio_page.dart';


import 'package:brew_crew/services/database.dart';
import 'package:brew_crew/services/pay.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MainDrawer extends StatefulWidget {
  final UserData b;
  MainDrawer({this.b});

  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;

  @override
  void initState() {
    super.initState();
    initUser();
  }

  initUser() async {
    user = await _auth.currentUser();
    setState(() {});
  }

String ename;
String email;


/*@override
  void initState() {
    databaseService.getQuizData().then((value) {
      ename:.data['Cname'],
      setState(() {});
    });
    super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
   





    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              child:Text("A"
              ,style:TextStyle(color:Colors.black87,fontSize: 40,fontWeight:FontWeight.bold)),
              backgroundColor: Colors.white70,
            ),
            accountName: Text(
              "Hello Bob",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            accountEmail: Text("bob@gmail.com",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            decoration: BoxDecoration(
              color: Colors.brown[400],
            ),
          ),
         
          ListTile(
              leading: Icon(
                Icons.payment_outlined,
                size: 30,
                color: Colors.black87,
              ),
              title: Text("Payment"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Payment()));
              }),
          ListTile(
              leading:
                  Icon(Icons.my_library_music, size: 30, color: Colors.black87),
              title: Text("Take a break"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => RadioPage()));
              }
              // trailing: Icon(Icons.arrow_forward),
              ),
        
          ListTile(
            leading: Icon(Icons.person, size: 30, color: Colors.black87),
            title: Text('Logout'),
            onTap: () async {
              await _auth.signOut();
            },
          ),
        ],
      ),
    );
  }
}
