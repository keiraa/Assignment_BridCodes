import 'package:assignment/Screens/HomePage.dart';
import 'package:assignment/Screens/profilePage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:assignment/Requisities/TextStyles.dart';

class NavPage extends StatefulWidget {
  @override
  _NavPageState createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int _currentIndex = 0;

  FirebaseAuth _auth = FirebaseAuth.instance;
  Firestore firestore = Firestore.instance;
  FirebaseUser currentUser;
  String userName = 'user',email = 'user@gmail.com';

  void getCurrentUser() async{
    currentUser = await _auth.currentUser();
    DocumentReference data = firestore.collection('users').document(currentUser.uid);
    data.get().then((value) {
      setState(() {
        userName = value.data['username'];
        email = currentUser.email;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _screens = [HomePage(userName: userName,),HomePage(userName: userName,),HomePage(userName: userName,),ProfilePage(userName: userName,email: email,)];
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavigationBar(
          selectedLabelStyle: navStyle.copyWith(fontWeight: FontWeight.w700),
          iconSize: 20,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xffeeeeee),
          currentIndex: _currentIndex,
          items: kNavBarList,
          onTap: (index) {
        setState(() {
          _currentIndex = index;
        });}
        ),
      ),
    );
  }
}
