import 'package:flutter/material.dart';
import 'package:istore/requisities/TextStyles.dart';
import 'package:otp_text_field/otp_text_field.dart';

class ZIPScreen extends StatefulWidget {
  @override
  _ZIPScreenState createState() => _ZIPScreenState();
}

class _ZIPScreenState extends State<ZIPScreen> {

  String pin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05,vertical: MediaQuery.of(context).size.height*0.015),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height*0.1,
              ),
              Container(
                child: Text(
                  'Hey User',//'Hey $userMail,',
                  style: kMainHeaderStyle,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.1,
              ),
              Container(
                child: Text(
                  'Please enter your Area \nZip/Pin Code',
                  style: kDetailStyle,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.04,
              ),
              Container(
                alignment: AlignmentDirectional.topStart,
                child: CircleAvatar(
                  backgroundColor: Color(0x51ffd21c),
                  radius: 15,
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1),
                child: OTPTextField(
                  onChanged: (value){
                    pin=value;
                  },
                  length: 6,
                  width: MediaQuery.of(context).size.width*0.6,
                  fieldWidth: 20,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  textFieldAlignment: MainAxisAlignment.spaceEvenly,
                  onCompleted: (pin){
                    print("Completed: "+ pin);
                  },
                ),
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height*0.1,
              ),

              Container(
                child: Text(
                  'Now, We can show you\nnearby outlets',
                  style: kDetailStyle,
                ),
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height*0.1,
              ),


              Center(
                child: GestureDetector(
                  onTap: (){
                    //TODO: Let's Start Functionality
                  },
                  child: GestureDetector(
                    onTap: (){
                      //_firestore.collection('Details').document('$userID').updateData({'PIN': pin});
                      //Navigator.push(context, MaterialPageRoute(builder: (context)=>NavPage()));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width*0.5,
                      height: MediaQuery.of(context).size.height*0.07,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Color(0xffffd21c),
                      ),
                      child: Stack(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Image(
                                image: AssetImage('images/buttonCurve.png'),
                              )
                            ],
                            mainAxisAlignment: MainAxisAlignment.end,
                          ),
                          Center(
                            child: Text(
                              'Let\'s Start',
                              style: kLoginStyle,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
