import 'package:assignment/Requisities/TextStyles.dart';
import 'package:assignment/Screens/backend.dart';
import 'package:assignment/Screens/createAccount.dart';
import 'package:assignment/Screens/navigationScreen.dart';
import 'package:assignment/Screens/signInPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:assignment/Requisities/darkMode.dart' as darkMode;


void main(){
  runApp(
    MaterialApp(
      home: MyApp(),
      theme: ThemeData.light().copyWith(
        unselectedWidgetColor: Color(0xff155cb0),
      ),
    )
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Color backGround = Color(0xff155cb0);

  void getData() async{
    final prefs = await SharedPreferences.getInstance();
    darkMode.darkMode = prefs.getBool('isDark') ?? false;
  }

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    getData();
    backGround = darkMode.darkMode?Color(0xff121212):Color(0xff155cb0);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          color: backGround,
        ),
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Welcome',
              style: welcomeStyle,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.025,
            ),
            Text(
              'Manage your Business',
              style: sideStyle,
            ),
            SizedBox(
              height: 1.5,
            ),
            Text(
              'seemlessly & intuitively',
              style: sideHeaderStyle,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.035,
            ),
            GestureDetector(
              onTap: (){
                signInWithGoogle(context);
              },
              child: Container(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 7,
                      ),
                      Tab(
                        icon: Image(
                          image: AssetImage('images/googleIcon.png'),
                        ),
                      ),
                      SizedBox(width: 30,),
                      Text(
                        'Sign in with Google',
                        style: buttonStyle,
                      )
                    ],
                  ),
                )
              ),
            ),
            SizedBox(
              height: 8,
            ),
            GestureDetector(
              child: Container(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white,width: 2.5),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    color: Color(0xff155cb0),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Center(
                        child: Text(
                          'Create an Account',
                          style: buttonStyle.copyWith(
                            color: Colors.white
                          ),
                        ),
                      ),
                    )
                  )
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateAccount()));
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.035,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Already have an account? ',
                  style: sideStyle.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                  },
                  child: Text(
                    'Sign in',
                    style: sideHeaderStyle.copyWith(
                      fontSize: 15,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.1,),
          ],
        ),
      ),
    );
  }
}
