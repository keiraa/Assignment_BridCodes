import 'package:flutter/material.dart';
import 'package:istore/requisities/TextStyles.dart';
import 'package:istore/screens/LoginPage.dart';






class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    bool showSpinner = false;
    String email;
    String password;
    String name;
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
              vertical: MediaQuery.of(context).size.height * 0.015),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              GestureDetector(
                child: Text(
                  'Sign in',
                  style: kSignUp,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                },
              ),
              Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.4),
                child: CircleAvatar(
                  backgroundColor: Color(0xa1ffd21c),
                  radius: 25,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.001,
              ),
              Center(
                child: Text(
                  'Sign up',
                  style: kLoginHeader,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      onChanged: (value) {
                        name = value;
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Name is Required';
                        }

                        return null;
                      },
                      decoration: kLoginCredentials.copyWith(
                        hintText: 'Name',
                      ),
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    TextFormField(
                      onChanged: (value) {
                        email = value;
                      },
                      decoration: kLoginCredentials,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    TextFormField(
                      onChanged: (value) {
                        password = value;
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Password is Required';
                        }

                        return null;
                      },
                      obscureText: true,
                      decoration: kLoginCredentials.copyWith(
                        hintText: 'Password',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {

                  });
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.08,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Color(0xffffd21c),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Image(
                        image: AssetImage('images/circle.png'),
                      ),
                      Center(
                        child: Text(
                          'Create Account',
                          style: kLoginStyle,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              GestureDetector(
                onTap: () {
                  //TODO: Facebook SignUp Functionality
                },
                child: Card(
                  elevation: 10,
                  child: IntrinsicHeight(
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding:
                          EdgeInsets.only(top: 5, left: 10, bottom: 5),
                          child: Tab(
                            icon: Image(
                              image: AssetImage('images/fbIcon.png'),
                              height: 20,
                              width: 20,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: VerticalDivider(
                            thickness: 2,
                            width: 10,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Signup using Facebook',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              GestureDetector(
                onTap: () {

                },
                child: Card(
                  elevation: 10,
                  child: IntrinsicHeight(
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              top: 5, left: 10, bottom: 5),
                          child: Tab(
                            icon: Image(
                              image: AssetImage('images/googleIcon.png'),
                              height: 20,
                              width: 20,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: VerticalDivider(
                            thickness: 2,
                            width: 10,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Signup using Gmail',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.08,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    //TODO: Skip SignIn Functionality
                  },
                  child: Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.4,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.065,
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
                            'Skip Signup',
                            style: kLoginStyle,
                          ),
                        )
                      ],
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