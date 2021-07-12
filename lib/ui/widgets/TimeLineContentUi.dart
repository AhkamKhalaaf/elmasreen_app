import 'package:flutter/material.dart';
class TimeLineContentUi extends StatelessWidget {
  final Color color;
  final String title;
  final String time;
  final double paddingTop;

  const TimeLineContentUi({Key key, this.color, this.title, this.time, this.paddingTop}) : super(key: key);

   @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(
    top: paddingTop,right: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
        Text(title,style: TextStyle(color: color,fontSize: 12.0),),
        Text(time,style: TextStyle(color: color,fontSize: 10.0),)
      ],),
    );
  }
}
