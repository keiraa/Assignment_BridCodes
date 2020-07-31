import 'package:assignment/Requisities/TextStyles.dart';
import 'package:assignment/Screens/HomePage.dart';
import 'package:assignment/Screens/navigationScreen.dart';
import 'package:assignment/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:assignment/Requisities/darkMode.dart' as darkMode;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OTPVerification extends StatefulWidget {
  OTPVerification({@required this.phoneNumber});
  final String phoneNumber;

  @override
  _OTPVerificationState createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  double iconSize=0;
  Color backGround = Color(0xff1f1f1f),titleText = Colors.white,backContainer = Color(0xff155cb0);
  String otp;
  bool value=false;
  String a;
  FirebaseAuth _auth = FirebaseAuth.instance;

  void initiateOTP() async{
    await loginUser(context);
    print(a);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initiateOTP();
    setState((){
      backGround = darkMode.darkMode ? Color(0xff1f1f1f) : Colors.white;
      titleText = darkMode.darkMode ? Colors.white : Colors.black;
      backContainer = darkMode.darkMode?Color(0xff121212):Color(0xff155cb0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xff155cb0),
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
            SizedBox(height: MediaQuery.of(context).size.height*0.04,),
            Expanded(
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    color: backGround,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: ListView(
                    children: <Widget>[
                      Text(
                        'OTP Verification',
                        style: welcomeStyle.copyWith(color: titleText,fontSize: 25),
                      ),
                      SizedBox(height: 7,),
                      Text(
                        'Have you recieved a four digit',
                        style: subHeaderStyle,
                      ),
                      SizedBox(height: 3,),
                      Text(
                        'Verification Code?',
                        style: subHeaderStyle,
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                      Container(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Flexible(
                              flex:6,
                              child: PinCodeTextField(
                                length: 6,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                obsecureText: false,
                                animationType: AnimationType.fade,
                                pinTheme: PinTheme(
                                  shape: PinCodeFieldShape.box,
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  fieldWidth: 40,
                                  fieldHeight: 40,
                                  selectedFillColor: Color(0xffeeeeee),
                                  inactiveColor: Color(0xffe0e0e0),
                                  inactiveFillColor: Color(0xffe0e0e0),
                                  activeColor: Color(0xffe0e0e0),
                                  activeFillColor: Color(0xffe0e0e0),
                                ),
                                backgroundColor: backGround,
                                enableActiveFill: true,
                                animationDuration: Duration(milliseconds: 300),
                                onCompleted: (value){
                                  otp = value;
                                },
                                onChanged: (value){
                                  if(value.length == 6){
                                    setState(() {
                                      iconSize = 25;
                                    });
                                  }
                                  else{
                                    setState(() {
                                      iconSize = 0;
                                    });
                                  }
                                },
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Align(
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.check_circle,
                                  color: Color(0xff0288d1),
                                  size: iconSize,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.015,),
                      Padding(padding: EdgeInsets.only(left: 10),child: Text('Resend Code',style: labelStyle.copyWith(fontWeight: FontWeight.bold),)),
                      SizedBox(height: MediaQuery.of(context).size.height*0.06,),
                      GestureDetector(
                        onTap: () async{
                          AuthCredential credential = PhoneAuthProvider.getCredential(
                              verificationId: a, smsCode: otp);

                          AuthResult result =
                              await _auth.signInWithCredential(credential);

                          FirebaseUser user = result.user;

                          if (user != null) {

                            Fluttertoast.showToast(
                              msg: 'Registered Successfully!',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.grey,
                              textColor: Color(0xff155cb0),
                            );

                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
                          } else {
                            print("Error");
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.01,bottom: 20),
                          child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                              color: Color(0xff155cb0),
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Center(
                                  child: Text(
                                    'Verify',
                                    style: buttonStyle.copyWith(
                                        color: Colors.white
                                    ),
                                  ),
                                ),
                              )
                          ),
                        ),
                      ),
                    ],
                  )
              ),
            )
          ],
        ),
      ),
    );
  }


  Future<bool> loginUser(BuildContext context) async {
    _auth.verifyPhoneNumber(
        phoneNumber: "+91" + widget.phoneNumber.substring(4,14),
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async {
          //Navigator.of(context).pop();

          FirebaseUser user = await _auth.currentUser();
          try{
            user.linkWithCredential(credential);
          }catch( e)
          {
            print (e);
          }

          if (user != null) {

            Fluttertoast.showToast(
              msg: 'Registered Successfully!',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.grey,
              textColor: Color(0xff155cb0),
            );

            Navigator.pop(context);
            Navigator.pop(context);
            Navigator.pop(context);
            Navigator.push(context,MaterialPageRoute(builder: (context) => MyApp()));
          } else {
            print("Error");
          }

          //This callback would gets called when verification is done auto maticlly
        },
        verificationFailed: (AuthException exception) {
          print(exception.message);
        },
        codeSent: (String verificationId, [int forceResendingToken]) {
          a = verificationId;
        },
        codeAutoRetrievalTimeout: null);
  }

}
