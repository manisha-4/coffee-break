import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/models/user.dart';


import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference brewCollection = Firestore.instance.collection('brews');

  Future<void> updateUserData(String sugars, String name, int strength) async {
    return await brewCollection.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strength': strength,
      
    });
  }


  





 /*Future<void> getUserData() async {
    return brewCollection.snapshots();
  }*/
//upadte user contact

/*Future<void> updateUserContact(String name, String email, String job) async {
    return await brewCollection.document(uid).setData({
      'Cname': name,
      'email': email,
      'job': job,
    });
  }
*/

//contact list from snapshot 
 /*List<Contact> _contactListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      //print(doc.data);
      return Contact(
        name: doc.data['name'] ?? '',
        email: doc.data['email'] ?? 0,
        job: doc.data['job'] ?? '0'
      );
    }).toList();
  }
// return snapshot of user details
UserContact _userContactFromSnapshot(DocumentSnapshot snapshot) {
    return UserContact(
      uid: uid,
      name: snapshot.data['name'],
      email: snapshot.data['email'],
      job: snapshot.data['job']
    );
  }



 Stream<List<Contact>> get Contact {
    return brewCollection.snapshots()
      .map(_contactListFromSnapshot);
  }

  // get user doc stream
  Stream<UserContact> get UserContact {
    return brewCollection.document(uid).snapshots()
      .map(_userContactFromSnapshot);
  }


*/





  // brew list from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      //print(doc.data);
      return Brew(
        name: doc.data['name'] ?? '',
        strength: doc.data['strength'] ?? 0,
        sugars: doc.data['sugars'] ?? '0'
      );
    }).toList();
  }

  // user data from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      sugars: snapshot.data['sugars'],
      strength: snapshot.data['strength']
    );
  }
//userdetails
/*UserData _userDetailsFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      Cname: snapshot.data['Cname'],
      email: snapshot.data['email'],
      job: snapshot.data['job']
    );
  }
*/




  // get brews stream
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots()
      .map(_brewListFromSnapshot);
  }

  // get user doc stream
  Stream<UserData> get userData {
    return brewCollection.document(uid).snapshots()
      .map(_userDataFromSnapshot);
  }

}
