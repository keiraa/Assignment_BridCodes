import 'package:assignment/Requisities/TextStyles.dart';
import 'package:assignment/Requisities/darkMode.dart' as darkMode;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ProfilePage extends StatefulWidget {
  ProfilePage({this.userName,this.email});
  final String userName,email;
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Color backGround = Color(0xff1f1f1f), backContainer = Color(0xff155cb0);
  SharedPreferences pref;
  void createPref() async{
    pref = await SharedPreferences.getInstance();
  }




  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    createPref();
    backGround = darkMode.darkMode?Color(0xff1f1f1f):Colors.white;
    backContainer = darkMode.darkMode?Color(0xff121212):Color(0xff155cb0);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
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
                    SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                    Text(
                      widget.userName,
                      style: welcomeStyle.copyWith(fontSize: 35),
                    ),
                    SizedBox(height: 2,),
                    Text(widget.email,style: labelStyle.copyWith(color: Colors.white),)
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
                  padding: EdgeInsets.symmetric(horizontal: 30),
                child: ListView(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),color: Color(0xffeceff1),),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Dark Mode',style: welcomeStyle.copyWith(fontSize: 18,color: Colors.black),),
                          Switch(
                            value: darkMode.darkMode,
                            onChanged: (bool){
                              setState(() {
                                darkMode.darkMode = !darkMode.darkMode;
                                pref.setBool('isDark', bool);
                                backGround = darkMode.darkMode?Color(0xff1f1f1f):Colors.white;
                                backContainer = darkMode.darkMode?Color(0xff121212):Color(0xff155cb0);
                              });
                            },
                            activeColor: Color(0xff212121),
                            focusColor: Color(0xff616161),
                            inactiveThumbColor: Color(0xffbdbdbd),
                            inactiveTrackColor: Color(0xffe0e0e0),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
