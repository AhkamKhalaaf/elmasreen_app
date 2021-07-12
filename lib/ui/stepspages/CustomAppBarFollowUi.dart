import 'package:elmasreenapp/ui/sidemenupages/FavoriteSideMenuUi.dart';
import 'package:elmasreenapp/ui/sidemenupages/NotificationSideMenuUi.dart';
import 'package:elmasreenapp/utils/app_Localization.dart';
import 'package:flutter/material.dart';

import '../HomePageUI.dart';
class CustomAppBarFollowUi extends StatelessWidget {
  final String title;

  const CustomAppBarFollowUi({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(height: 50.0,width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.25),
          spreadRadius: 1,
          blurRadius: 3,
          offset:
          Offset(0, 3), // changes position of shadow
        ),
      ],),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
      IconButton(icon:Icon(Icons.arrow_back_ios,
        color:Theme.of(context).accentColor, ), onPressed:(){
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
            HomePageUI()), (Route<dynamic> route) => false);
        return true;
      })
    ,
      Expanded(
        child: Text(title,
          style: TextStyle(color: Theme.of(context).accentColor),textAlign: TextAlign.center,),
      ),
      SizedBox(width: 40.0,),
//      IconButton(icon: ImageIcon(AssetImage('assets/icons/notification.png'),size: 20.0,
//        color: Theme.of(context).accentColor,), onPressed:(){
//
//        Navigator.push(
//          context,
//          MaterialPageRoute(builder: (context) => NotificationSideMenuUi()),
//        );
//      })

    ],),);
  }
}
