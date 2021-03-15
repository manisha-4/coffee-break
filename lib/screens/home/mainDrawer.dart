import 'package:brew_crew/services/pay.dart';
import 'package:brew_crew/todo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Drawer(

  child: ListView(
    children: <Widget>[

Center(
  child:   UserAccountsDrawerHeader(
    
    accountName: Text("Manisha ",
    style:TextStyle(fontSize: 20,fontWeight:FontWeight.bold),),
    accountEmail: Text("Manisha@gmail.com",
    style:TextStyle(fontSize:15,fontWeight:FontWeight.bold )),
    decoration: BoxDecoration(
                color: Colors.brown[400],
              ),
    currentAccountPicture: CircleAvatar(
      backgroundColor:
          Theme.of(context).platform == TargetPlatform.iOS
              ? Colors.blue
              : Colors.white,
      child: Text(
        "A",
        style: TextStyle(fontSize: 40.0,color:Colors.black87),
      ),
    ),
  ),
),





      ListTile(
        leading:Icon(Icons.today_outlined,
        size:30,
        color:Colors.black87),
        title: Text("To do list",style:TextStyle(fontSize:15,fontWeight: FontWeight.bold)),
        //trailing: Icon(Icons.arrow_forward),
        onTap: () {
  Navigator.of(context).pop();
  Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => Todo()));
},
      ),
      ListTile(
       
            leading:Icon(Icons.person,size:30,
        color:Colors.black87),
              title:Text('Logout'),
              onTap: () async {
                await _auth.signOut();
              },
        ),
      

       ListTile(
         leading:Icon(Icons.payment_outlined,size:30,
        color:Colors.black87,),
        title: Text("Payment"),
        onTap:() {
          Navigator.of(context).pop();
  Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => Payment()));
        }
        
      ),
         ListTile(
           leading:Icon(Icons.my_library_music,size:30,
        color:Colors.black87),
        title: Text("Take a break"),
       // trailing: Icon(Icons.arrow_forward),
      ),




    ],
  ),
      
    );
  }
}