import 'package:elmasreenapp/ui/IntroSliderUI.dart';
import 'package:elmasreenapp/ui/componentui/ButtonUi.dart';
import 'package:elmasreenapp/ui/layout/BackGroundLayout.dart';
import 'package:elmasreenapp/utils/app_Localization.dart';
import 'package:flutter/material.dart';
class SelectLanguageUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Stack(
    overflow: Overflow.visible,children: [
      BackGroundLayout(pathImage: 'assets/images/backsplashimage.png',),
      Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,children: [
          Expanded(flex: 2,child: SizedBox()),
          Image.asset('assets/images/logoraduis.png',width: MediaQuery.of(context).size.width * 0.6,

            height:  MediaQuery.of(context).size.width * 0.47,),
          Expanded(flex: 1,child: SizedBox()),

          ButtonUi(backColor: Theme.of(context).accentColor,
             widget:   Text(DemoLocalizations.of(context).title['language_arabic']
               ,style: TextStyle(color: Theme.of(context).primaryColor,
                   fontWeight: FontWeight.bold),),
            function: (){
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (BuildContext context) => IntroSliderUI()));
          },),
          SizedBox(height: 20.0,),

          ButtonUi(backColor:Colors.white,
            widget:     Text(DemoLocalizations.of(context).title['language_english']
              ,style: TextStyle(color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.bold),) ,
            function: (){
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (BuildContext context) => IntroSliderUI()));
            },),
          Expanded(flex: 1,child: SizedBox()),


        ],),
      )
    ],),));
  }
}
