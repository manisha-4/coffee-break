import 'package:brew_crew/admin/adminHomepage.dart';
import 'package:brew_crew/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brew_crew/models/user.dart';

class HomeDecide extends StatefulWidget {
  //final FirebaseUser user;
 const HomeDecide({Key key, this.user}) : super(key: key);
  final FirebaseUser user;
  

  @override
  _HomeDecideState createState() => _HomeDecideState();
}

class _HomeDecideState extends State<HomeDecide> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
       // title:Text('Welcome in admin  decide page'),
       // title: Text('Home ${widget.user.email}'),
     // ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: Firestore.instance
            .collection('brews')
            .document(widget.user.uid)
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            default:
              return checkRole(snapshot.data);
          }
        },
      ),
    );
  }

    checkRole(DocumentSnapshot snapshot) {
    if (snapshot.data['email'] == 'manisha@gmail.com') {
      return  adminHomePage();
     
    } else { return Home();
     
    }
  }
}

