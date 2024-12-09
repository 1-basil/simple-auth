import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:development/models/user.dart';


class DatabaseService {


  //instance
  final CollectionReference Usercollection =  FirebaseFirestore.instance.collection('Users');
  String currentUsername = '';

  //constructor
  String uid;
  DatabaseService({
    required this.uid
});

  //collection reference
  Future UpdateUserdata(String Username,String email ) async{
         return await Usercollection.doc(uid).set({
           'username' : Username,
           'email': email,

         });
  }

  

  Userdata _userDataFromSnapshot(DocumentSnapshot snapshot){
    return Userdata(
      uid : uid,
      username: snapshot.get('username'),
      email: snapshot.get('email'),

    );   
  }

  // get user doc stream
  Stream<Userdata> get userdata {
    return Usercollection.doc(uid).snapshots()
        .map(_userDataFromSnapshot);
  }


}