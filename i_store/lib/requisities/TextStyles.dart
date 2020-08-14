import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kHeaderStyle = TextStyle(
  color: Colors.white,
  fontSize: 30,
  fontWeight: FontWeight.w600,
);

const ksearchBarDecoration = InputDecoration(
  hintText: 'Find a Shop by Name or Product',
  hintStyle: TextStyle(
    fontSize: 12,
    color: Color(0xffCACACA),
    fontWeight: FontWeight.w500,
  ),
  disabledBorder: InputBorder.none,
  focusedBorder: InputBorder.none,
  enabledBorder: InputBorder.none,
  border: InputBorder.none,
);

const List<BottomNavigationBarItem> kNavBarList = [
  BottomNavigationBarItem(
    icon: Tab(
      icon: Image(
        image: AssetImage('images/homeIcon.png'),
      ),
    ),
    activeIcon: Tab(
      icon: Image(
        image: AssetImage('images/home.png'),
        height: 30,
        width: 30,
      ),
    ),
    title: Text(''),
    backgroundColor: Colors.white,
  ),
  BottomNavigationBarItem(
    icon: Tab(
      icon: Image(
        image: AssetImage('images/grocIcon.png'),
      ),
    ),
    activeIcon: Tab(
      icon: Image(
        image: AssetImage('images/grocIconSelected.png'),
      ),
    ),
    title: Text(''),
    backgroundColor: Colors.white,
  ),
  BottomNavigationBarItem(
    icon: Tab(
      icon: Image(
        image: AssetImage('images/QRIcon.png'),
      ),
    ),
    activeIcon: Tab(
      icon: Image(
        image: AssetImage('images/QRIconSelected.png'),
      ),
    ),
    title: Text(''),
    backgroundColor: Colors.white,
  ),
  BottomNavigationBarItem(
    icon: Tab(
      icon: Image(
        image: AssetImage('images/locationIcon.png'),
      ),
    ),
    activeIcon: Tab(
      icon: Image(
        image: AssetImage('images/locationIconSelected.png'),
      ),
    ),
    title: Text(''),
    backgroundColor: Colors.white,
  ),
  BottomNavigationBarItem(
    icon: Tab(
      icon: Image(
        image: AssetImage('images/BellIcon.png'),
      ),
    ),
    activeIcon: Tab(
      icon: Image(
        image: AssetImage('images/BellIconSelected.png'),
        height: 30,
        width: 30,
      ),
    ),
    title: Text(''),
    backgroundColor: Colors.white,
  )
];

const kFavTitle = TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.w700,
  color: Color(0xff555555),
);

const ksideBar = TextStyle(
  fontWeight: FontWeight.w500,
  color: Color(0xffCACACA),
  fontSize: 18,
);

const kiconText = TextStyle(
  fontSize: 15,
);

const kCatText = TextStyle(
  fontSize: 18,
);

const kSignIn = TextStyle(
  fontSize: 15,
  color: Color(0xff555555),
);

const kLoginStyle = TextStyle(
  color: Colors.white,
  fontSize: 20,
  fontWeight: FontWeight.w600,
);

const kLoginHeader = TextStyle(
  fontSize: 35,
  fontWeight: FontWeight.w600,
);

const kLoginCredentials = InputDecoration(
  contentPadding: EdgeInsets.all(20),
  hintText: 'Email',
  hintStyle: TextStyle(
    fontSize: 15,
    color: Color(0xffcacaca),
    fontWeight: FontWeight.w600,
  ),
  focusedBorder: InputBorder.none,
  enabledBorder: InputBorder.none,
  disabledBorder: InputBorder.none,
  filled: true,
  fillColor: Color(0xffF5F5F5),
);

const kSignUp = TextStyle(
  fontFamily: 'Lato',
  fontSize: 15,
  color: const Color(0x78404040),
  fontWeight: FontWeight.w700,
  shadows: [
    Shadow(
      color: const Color(0x29000000),
      offset: Offset(0, 3),
      blurRadius: 6,
    )
  ],
);

const kDetailStyle = TextStyle(
  color: Colors.black,
  fontSize: 25,
  fontFamily: 'Lato',
);

const kMainHeaderStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w600,
  fontSize: 50,
);