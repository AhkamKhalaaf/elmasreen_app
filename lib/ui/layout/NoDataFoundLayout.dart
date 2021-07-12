import 'package:dotted_border/dotted_border.dart';
import 'package:elmasreenapp/ui/HomePageUI.dart';
import 'package:elmasreenapp/utils/app_Localization.dart';
import 'package:flutter/material.dart';
class NoDataFoundLayout extends StatelessWidget {
  final String imagePath;
  final String title;
  final Widget widget;
  final bool spaceOrNot;

  const NoDataFoundLayout({Key key, this.imagePath, this.title, this.widget, this.spaceOrNot}) : super(key: key);


   @override
  Widget build(BuildContext context) {
    return Center(child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,children: [
             Image.asset(imagePath,width: MediaQuery.of(context).size.width *0.5,
                 height: MediaQuery.of(context).size.width *0.4,),

      !spaceOrNot?SizedBox( height: 20.0,):SizedBox(height: 20.0,),
              Text(title,style: Theme.of(context).textTheme.headline1,),
      !spaceOrNot?SizedBox(height: 20.0, ):SizedBox(height: 50.0,),
widget,
      SizedBox(height: MediaQuery.of(context).size.width *0.25)



    ],),);
  }
}
