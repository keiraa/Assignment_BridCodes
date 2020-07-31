import 'package:assignment/Requisities/TextStyles.dart';
import 'package:assignment/Requisities/darkMode.dart' as darkMode;
import 'package:assignment/Screens/backend.dart';
import 'package:assignment/Screens/createAccount.dart';
import 'package:assignment/Screens/navigationScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:string_validator/string_validator.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double piconSize=0,uiconSize=0;
  String email,password;
  Color backGround = Color(0xff1f1f1f),titleText = Colors.white,subText = Color(0xffc0c0c0),backContainer = Color(0xff155cb0);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      backGround = darkMode.darkMode?Color(0xff1f1f1f):Colors.white;
      titleText = darkMode.darkMode?Colors.white:Colors.black;
      backContainer = darkMode.darkMode?Color(0xff121212):Color(0xff155cb0);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    piconSize=0;
    uiconSize=0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          color: backContainer,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height*0.1,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                    onTap: (){
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                  Text(
                    'Welcome',
                    style: welcomeStyle.copyWith(fontSize: 35),
                  )
                ],
              )
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.05,),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  color: backGround,
                ),
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: SingleChildScrollView(
                  reverse: true,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom*0.2),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                          Text(
                            'Welcome Back',
                            style: welcomeStyle.copyWith(color: titleText,fontSize: 25),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*0.001,),
                          Text(
                            'Hello there, sign in to continue',
                            style: sideStyle.copyWith(color: subText,fontSize: 18,fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*0.07,),
                          Text(
                            'Username or Email',
                            style: buttonStyle.copyWith(color: subText,fontSize: 15),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                          TextField(
                            decoration: inputFieldStyle.copyWith(
                              suffixIcon: Icon(
                                Icons.check_circle,
                                color: Color(0xff0288d1),
                                size: uiconSize,
                              ),
                            ),
                            onChanged: (value){
                              email = value;
                              if(isEmail(value))
                                {
                                  setState(() {
                                    uiconSize = 20;
                                  });
                                }
                              else{
                                setState(() {
                                  uiconSize = 0;
                                });
                              }
                              //TODO: check Username or email is registered or not
                            },
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                          Text(
                            'Password',
                            style: buttonStyle.copyWith(color: subText,fontSize: 15),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                          TextField(
                            obscureText: true,
                            decoration: inputFieldStyle.copyWith(
                              suffixIcon: Icon(
                                Icons.check_circle,
                                color: Color(0xff0288d1),
                                size: piconSize,
                              ),
                              hintText: 'Enter your password',
                            ),
                            onChanged: (value){
                              password = value;
                              if(isAlphanumeric((value))){
                                setState(() {
                                  piconSize = 20;
                                });
                              }
                              else{
                                setState(() {
                                  piconSize = 0;
                                });
                              }
                              //TODO: check the Password
                            },
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                          Text('Forgot Password?',style: forgotStyle,),
                          GestureDetector(
                            onTap: (){
                              signInUser(email, password, context);
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.04),
                                child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                    ),
                                    color: Color(0xff155cb0),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(vertical: 10),
                                      child: Center(
                                        child: Text(
                                          'Sign In',
                                          style: buttonStyle.copyWith(
                                              color: Colors.white
                                          ),
                                        ),
                                      ),
                                    )
                                ),
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Don\'t have an account? ',
                                style: sideStyle.copyWith(
                                    color: subText,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  Navigator.pop(context);
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateAccount()));
                                },
                                child: Text(
                                  'Sign Up',
                                  style: sideHeaderStyle.copyWith(
                                    fontSize: 15,
                                    color: Color(0xff155cb0),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*0.06,)
                        ],
                      ),
                    ),
                  ),
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}

