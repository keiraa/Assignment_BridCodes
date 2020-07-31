import 'package:assignment/Screens/OTPVerification.dar.dart';
import 'package:assignment/Screens/navigationScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:assignment/Requisities/darkMode.dart' as darkMode;
import 'package:google_sign_in/google_sign_in.dart';

final _auth = FirebaseAuth.instance;
final firestoreInstance = Firestore.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

registeruser(email,password,username,phoneNumber,context)
async{
  final newuser = await _auth.createUserWithEmailAndPassword(
      email: email, password: password);
  await _auth.signInWithEmailAndPassword(email: email, password: password);
  FirebaseUser curUser = await _auth.currentUser();
  if(newuser!=null)
    {
      DocumentReference data= firestoreInstance.collection('users').document(curUser.uid);
      data.setData({'username': username,'phone':phoneNumber});
      Navigator.push(context, MaterialPageRoute(builder: (context)=>OTPVerification(phoneNumber: phoneNumber,)));
      // I need to store the username and also the phone number while registering
    }
}

signInUser(email,password,context)async{
  final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
  if(user!=null){
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>NavPage()));
  }
  else{
    Fluttertoast.showToast(
      msg: 'User not Registered',
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_SHORT,
      textColor: Colors.red,
      backgroundColor: Colors.grey,
      timeInSecForIosWeb: 5,
    );
  }
}


Future<String> signInWithGoogle(context) async {
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
  await googleSignInAccount.authentication;
  try {
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    final AuthResult authResult = await _auth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;

    // Checking if email and name is null
    FirebaseUser curUser = await _auth.currentUser();


    String name = user.displayName;
    String email1 = user.email;
    print(name);
    print(email1);

    // Only taking the first part of the name, i.e., First Name
    if (name.contains(" ")) {
      name = name.substring(0, name.indexOf(" "));
      darkMode.userName=name;
    }

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);
    if (user != null) {
      Fluttertoast.showToast(
          msg: "Registered  successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.grey,
          textColor: Colors.black,
          timeInSecForIosWeb: 5);
      DocumentReference data= firestoreInstance.collection('users').document(curUser.uid);
      data.setData({'username': name});
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NavPage()),
      );
    } else {
      print('yes');
      Fluttertoast.showToast(
          msg: 'registration failed',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 5);
    }


    return 'signInWithGoogle succeeded: $user';
  } catch (e) {
    print(e);
  }
}