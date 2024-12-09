import 'package:development/models/user.dart';
import 'package:development/service/DBS.dart';
import 'package:firebase_auth/firebase_auth.dart';

class authService{


  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? errormessage = '';



  // create an user object based on firebaseUser
  MyUser ? _userfromFireBaseUser(User user){
    return user != null ? MyUser(uid: user.uid) : null;
  }


  //auth change  user stream
  Stream<MyUser> get user {
    return _auth.authStateChanges().map((User? user) => _userfromFireBaseUser(user!)!);
  }


  // login as anonymous user
  Future signinAnno() async{
    try{
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userfromFireBaseUser(user!);
    }
    on FirebaseAuthException catch(e){
      print(e.toString());
      errormessage = e.message;
      return null;
    }
  }


  //signiup with email and password
  Future registerWithEmailandPass(String Email ,String username,String Password )async{
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: Email, password: Password);
      User? user = result.user;
      await DatabaseService(uid : user!.uid).UpdateUserdata(username,Email);
      return _userfromFireBaseUser(user);
    }on FirebaseAuthException catch(e){
      print(e.toString());
      errormessage = e.message;
      return null;
    }
  }



  // login with email and password
  Future login(String Email , String Password) async{
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: Email, password:Password);
      User? user = result.user;
      return _userfromFireBaseUser(user!);
    }on FirebaseAuthException catch(e){
      print(e.toString());
      errormessage = e.message;
      return null;
    }

  }


  //forgot password method
  Future forgotPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      print("Password reset email sent to $email");
      return true;
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      errormessage = e.message;
      return null;
    }
  }



  // signout the logged in user
Future signout() async{
  try{
    return await _auth.signOut();
  }on FirebaseAuthException catch(e){
    print(e.toString());
    errormessage = e.message;
    return null;
  }
}



}

