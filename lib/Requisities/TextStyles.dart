import 'package:flutter/material.dart';

var welcomeStyle = TextStyle(
  fontSize: 28,
  color: Colors.white,
  fontWeight: FontWeight.w700,
);

const sideStyle = TextStyle(
  fontWeight: FontWeight.w400,
  color: Colors.white,
  fontSize: 22,
);

var sideHeaderStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w600,
  fontSize: 25,
);

var buttonStyle = TextStyle(
  color: Color(0xff0ff155cb0),
  fontSize: 18,
  fontWeight: FontWeight.w700,
);

var subHeaderStyle = TextStyle(
  color: Color(0xffc0c0c0),
  fontSize: 18,
  fontWeight: FontWeight.w600,
);

var forgotStyle = TextStyle(
  color: Color(0xff155cb0),
  fontWeight: FontWeight.w700,
  fontSize: 15,
  wordSpacing: 2,
);

var labelStyle = buttonStyle.copyWith(color: Color(0xffc0c0c0),fontSize: 15);

var termsStyle = TextStyle(
  fontSize: 12,
  color: Color(0xff155cb0),
  fontWeight: FontWeight.w600,
);

var wishStyle = TextStyle(
  fontSize: 25,
  color: Color(0xffc0c0c0),
);

var termPrefixStyle = TextStyle(
  color: Colors.grey,
  fontSize: 12,
);

var inputFieldStyle = InputDecoration(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(
      width: 0,
      style: BorderStyle.none,
    ),
  ),
  filled: true,
  fillColor: Color(0xffeeeeee),
  hintText: 'Enter your Username or Email',
  hintStyle: buttonStyle.copyWith(color: Color(0xffc0c0c0),fontSize: 15),
  contentPadding: EdgeInsets.symmetric(horizontal: 30),
);


var searchFieldStyle = InputDecoration(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(
      width: 0,
      style: BorderStyle.none,
    ),
  ),
  filled: true,
  fillColor: Color(0xffeeeeee),
  hintText: 'Search',
  hintStyle: buttonStyle.copyWith(color: Color(0xffc0c0c0),fontSize: 15),
  contentPadding: EdgeInsets.symmetric(horizontal: 30),
  suffixIcon: Icon(Icons.mic_none,color: Color(0xff155cb0),),
  prefixIcon: Icon(Icons.search,color: Color(0xff155cb0),)
);

var percentageStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w400,
);

var circleText = TextStyle(
  color: Colors.white,
  fontSize: 15,
);

const navStyle = TextStyle(
  fontWeight: FontWeight.w600,
  color: Color(0xff9e9e9e),
  fontSize: 15,
);

const List<BottomNavigationBarItem> kNavBarList = [
  BottomNavigationBarItem(
      title: Text('Home',style: navStyle,),
      icon: Tab(
        icon: Image(
          image: AssetImage('images/cofee.png'),
          height: 30,
          width: 30,
        ),
      )
  ),
  BottomNavigationBarItem(
      title: Text('Messages',style: navStyle,),
      icon: Tab(
        icon: Image(
          image: AssetImage('images/Message.png'),
          height: 30,
          width: 30,
        ),
      )
  ),
  BottomNavigationBarItem(
      title: Text('Purchase',style: navStyle,),
      icon: Tab(
        icon: Image(
          image: AssetImage('images/creditCard.png'),
          height: 30,
          width: 30,
        ),
      )
  ),
  BottomNavigationBarItem(
      title: Text('Profile',style: navStyle,),
      icon: Tab(
        icon: Image(
          image: AssetImage('images/profile.png'),
          height: 30,
          width: 30,
        ),
      )
  ),
];

const toggleHeaderStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w500,
  fontSize: 25,
);

const toggleHeaderStyleSelected = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w700,
  fontSize: 26,
);


const todoHeaderStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w500,
  fontSize: 17,
);

const timeStyle = TextStyle(
  color: Color(0xffc0c0c0),
  fontSize: 16,
  fontWeight: FontWeight.w600,
);