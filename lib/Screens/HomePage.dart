import 'package:assignment/Requisities/TextStyles.dart';
import 'package:assignment/Requisities/progressCard.dart';
import 'package:assignment/Requisities/darkMode.dart' as darkMode;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({this.userName});
  final String userName;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TextStyle> ts = [toggleHeaderStyleSelected,toggleHeaderStyle,toggleHeaderStyle];
  List<bool> v = [true,false,false];
  List<List<String>> todoElements = [['Republic Day Creative','Social Media Creative','10.20 am'],['Sales Post for Campaign','Social Media Creative','03.40 pm']];
  Color backGround = Color(0xff1f1f1f),titleText = Colors.white,iconColor;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    backGround = darkMode.darkMode ? Color(0xff1f1f1f) : Colors.white;
    titleText = darkMode.darkMode ? Colors.white : Colors.black;
    iconColor = darkMode.darkMode ? Colors.white : Colors.black;
  }

  void toggleClick(int n){
    for(int i=0;i<3;i++)
      {
        if(i==n)
          {
            ts[i] = toggleHeaderStyleSelected;
            v[i] = true;
          }
        else
          {
            ts[i] = toggleHeaderStyle;
            v[i] = false;
          }
      }
  }


  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: backGround,
        padding: EdgeInsets.symmetric(horizontal: 35),
        child: ListView(
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height*0.01,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Good Morning,',style: wishStyle,),
                Icon(Icons.notifications,color: iconColor,)
              ],
            ),
            Text(widget.userName,style: welcomeStyle.copyWith(color: titleText,fontSize: 25),),   //TODO: change the name as per the user
            SizedBox(height: MediaQuery.of(context).size.height*0.02,),
            TextField(
              decoration: searchFieldStyle,
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.025,),
            Text('Projects',style: welcomeStyle.copyWith(color: titleText,fontSize: 25),),
            SizedBox(height: MediaQuery.of(context).size.height*0.02,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  ProgressCard(name: 'App Design',percentage: 0.75,rating: '4+',),
                  ProgressCard(name: 'Social Media',percentage: 0.75,rating: '4+',),
                  ProgressCard(name: 'Web Design',percentage: 0.5,rating: '3+',),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.03,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ServiceCard(name: 'Request Sevice',),
                ServiceCard(name: 'Support',)
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.01,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ServiceCard(name: 'Appointment',),
                ServiceCard(name: 'News',),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.02,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Today', style: ts[0].copyWith(color: titleText),),
                        Visibility(
                          visible: v[0],
                          child: SizedBox(width: 30,child: Divider(color: Color(0xff155cb0),thickness: 5,))
                        )
                      ],
                    ),
                    onTap: (){
                      setState(() {
                        toggleClick(0);
                        todoElements = [['Republic Day Creative','Social Media Creative','10.20 am'],['Sales Post for Campaign','Social Media Creative','03.40 pm']];
                      });
                    },
                  ),
                  GestureDetector(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Week', style: ts[1].copyWith(color: titleText),),
                        Visibility(
                          visible: v[1],
                          child: SizedBox(width: 30,child: Divider(color: Color(0xff155cb0),thickness: 5,))
                        )
                      ],
                    ),
                    onTap: (){
                      setState(() {
                        toggleClick(1);
                        todoElements = [];
                      });
                    },
                  ),
                  GestureDetector(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Month', style: ts[2].copyWith(color: titleText),),
                        Visibility(
                          visible: v[2],
                          child: SizedBox(width: 30,child: Divider(color: Color(0xff155cb0),thickness: 5,))
                        )
                      ],
                    ),
                    onTap: (){
                      setState(() {
                        toggleClick(2);
                        todoElements = [];
                      });
                    },
                  ),
                ],
              ),
            ),
            Column(
              children: todoElements.map<Widget>((element){
                return TodoMenuElement(
                  elements: element,
                  titleColor: titleText,
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}











//Manual Widgets

class ServiceCard extends StatefulWidget {
  ServiceCard({this.name});
  final String name;

  @override
  _ServiceCardState createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 150,
      child: Card(
        color: Color(0xff155cb0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Center(
          child: Text(
            widget.name,
            style: labelStyle.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class TodoMenuElement extends StatelessWidget {
  TodoMenuElement({this.elements,this.titleColor});
  final List<String> elements;
  final Color titleColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(
                    Icons.check_circle,
                    size: 20,
                    color: Color(0xff155cb0),
                  ),
                  SizedBox(width: 10,),
                  Text(elements[0],style: todoHeaderStyle.copyWith(color: titleColor),),
                ],
              ),
              Text(elements[2],style: timeStyle,)
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(elements[1],style: timeStyle,),
          )
        ],
      ),
    );
  }
}


