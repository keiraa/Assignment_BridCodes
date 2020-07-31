import 'package:assignment/Requisities/TextStyles.dart';
import 'package:assignment/Screens/backend.dart';
import 'package:assignment/Screens/signInPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:assignment/Requisities/darkMode.dart' as darkMode;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:string_validator/string_validator.dart';


class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  double eiconSize=0,paiconSize=0,niconSize=0,miconSize=0;
  Color backGround = Color(0xff1f1f1f),titleText = Colors.white,backContainer = Color(0xff155cb0);
  bool value=false;
  FocusNode _focusNode = FocusNode();
  double bottom;
  String name,email,phone,password;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      backGround = darkMode.darkMode ? Color(0xff1f1f1f) : Colors.white;
      titleText = darkMode.darkMode ? Colors.white : Colors.black;
      backContainer = darkMode.darkMode?Color(0xff121212):Color(0xff155cb0);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    eiconSize=0;paiconSize=0;niconSize=0;miconSize=0;;
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
          color: backContainer,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height*0.07,),
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
                      'Create Account',
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
                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom*0.5),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Welcome',
                              style: welcomeStyle.copyWith(color: titleText,fontSize: 25),
                            ),
                            SizedBox(height: 3,),
                            Text(
                              'Hello there, sign up to continue',
                              style: subHeaderStyle,
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                            Text(
                              'Name',
                              style: labelStyle,
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                            TextField(
                              decoration: inputFieldStyle.copyWith(
                                suffixIcon: Icon(
                                  Icons.check_circle,
                                  color: Color(0xff0288d1),
                                  size: niconSize,
                                ),
                                hintText: 'Enter your Business Name',
                              ),
                              onChanged: (value){
                                if(isAlpha(value)){
                                  setState(() {
                                    niconSize = 20;
                                  });
                                }
                                else{
                                  setState(() {
                                    niconSize = 0;
                                  });
                                }
                                name = value;
                              },
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                            Text(
                              'Email',
                              style: labelStyle,
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                            TextField(
                              decoration: inputFieldStyle.copyWith(
                                suffixIcon: Icon(
                                  Icons.check_circle,
                                  color: Color(0xff0288d1),
                                  size: eiconSize,
                                ),
                                hintText: 'Enter your Business Email',
                              ),
                              onChanged: (value){
                                if(isEmail(value)){
                                  setState(() {
                                    eiconSize=20;
                                  });
                                  email = value;
                                }
                                else{
                                  setState(() {
                                    eiconSize=0;
                                  });
                                }
                              },
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*0.015,),
                            Text(
                              'Mobile Number',
                              style: labelStyle,
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                            TextField(
                              decoration: inputFieldStyle.copyWith(
                                suffixIcon: Icon(
                                  Icons.check_circle,
                                  color: Color(0xff0288d1),
                                  size: miconSize,
                                ),
                                hintText: '+91-XXXXXXXXXX',
                              ),
                              onChanged: (value){
                                if(value.length == 14)
                                  {
                                    setState(() {
                                      miconSize = 20;
                                    });
                                  }
                                else{
                                  setState(() {
                                    miconSize = 0;
                                  });
                                }
                                phone = value;
                              },
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                            Text(
                              'Password',
                              style: labelStyle,
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                            TextField(
                              obscureText: true,
                              decoration: inputFieldStyle.copyWith(
                                suffixIcon: Icon(
                                  Icons.check_circle,
                                  color: Color(0xff0288d1),
                                  size: paiconSize,
                                ),
                                hintText: 'Enter your Password',
                              ),
                              onChanged: (value){
                                if(isAlphanumeric(value)){
                                  setState(() {
                                    paiconSize = 20;
                                  });
                                }
                                else{
                                  setState(() {
                                    paiconSize=0;
                                  });
                                }
                                password = value;
                              },
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*0.01,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  height:20,
                                  width: 20,
                                  child: Checkbox(
                                    value: value,
                                    materialTapTargetSize: MaterialTapTargetSize.padded,
                                    onChanged: (x){
                                      setState(() {
                                        value = !value;
                                      });
                                    },
                                  ),
                                ),
                                SizedBox(width: 5,),
                                Text('By creating an account you agree to our',style: termPrefixStyle,)
                              ],
                            ),
                            Container(
                              child: Text('terms and conditions',style: termsStyle,),
                              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.06),
                            ),

                            GestureDetector(
                              child: GestureDetector(
                                child: Container(
                                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.01,bottom: MediaQuery.of(context).size.height*0.07),
                                  child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                      ),
                                      color: Color(0xff155cb0),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(vertical: 10),
                                        child: Center(
                                          child: Text(
                                            'Sign Up',
                                            style: buttonStyle.copyWith(
                                                color: Colors.white
                                            ),
                                          ),
                                        ),
                                      )
                                  ),
                                ),
                                onTap: (){
                                  if(value)
                                    {
                                      registeruser(email, password, name, phone, context);
                                    }
                                  else
                                    {
                                      Fluttertoast.showToast(
                                        msg: 'Please Agree to the terms and conditions',
                                        toastLength: Toast.LENGTH_LONG,
                                        gravity: ToastGravity.BOTTOM,
                                        backgroundColor: Colors.grey,
                                        textColor: Colors.red
                                      );
                                    }
                                },
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Already have an account?',
                                  style: sideStyle.copyWith(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.pop(context);
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                                  },
                                  child: Text(
                                    'Sign In',
                                    style: sideHeaderStyle.copyWith(
                                      fontSize: 15,
                                      color: Color(0xff155cb0),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 10,)
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

