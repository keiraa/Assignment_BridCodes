import 'package:assignment/Requisities/TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProgressCard extends StatelessWidget {
  ProgressCard({this.name,this.percentage,this.rating});
  final String name,rating;
  final double percentage;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5,vertical: 0),
      height: 190,
      width: 150,
      child: Card(
        color: Color(0xff155cb0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularPercentIndicator(
              radius: 60,
              lineWidth: 8,
              backgroundWidth: 5,
              animation: true,
              backgroundColor: Colors.black38,
              percent: percentage,
              progressColor: Colors.white,
              center: Text('75%',style: percentageStyle,),
              footer: Container(
                margin: EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  name,
                  style: subHeaderStyle.copyWith(color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      CircleAvatar(backgroundColor: Color(0xffbdbdbd),radius: 12,),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: CircleAvatar(backgroundColor: Color(0xff9e9e9e),radius: 12,),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: CircleAvatar(backgroundColor: Color(0xffbdbdbd),radius: 12,),
                      )
                    ],
                  ),
                  CircleAvatar(
                    child: Text(rating,style: circleText,),
                    radius: 12,
                    backgroundColor: Color(0xffbdbdbd),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
