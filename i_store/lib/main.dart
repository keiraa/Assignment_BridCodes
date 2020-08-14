import 'package:flutter/material.dart';
import 'package:istore/requisities/TextStyles.dart';
import 'package:istore/screens/LoginPage.dart';
import 'package:istore/screens/ZIPScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: ZIPScreen(),
    );
  }
}

