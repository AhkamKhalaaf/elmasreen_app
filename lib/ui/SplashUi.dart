import 'dart:async';
import 'package:elmasreenapp/core/providermodels/CartProvider.dart';
import 'package:elmasreenapp/ui/IntroSliderUI.dart';
 import 'package:elmasreenapp/utils/app_Localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'HomePageUI.dart';
class SplashUi extends StatefulWidget {
  final Widget backWidget;
  final String logoPath;

  const SplashUi({Key key, this.backWidget, this.logoPath}) : super(key: key);

   @override
  _SplashUiState createState() => _SplashUiState();
}
//showslider
class _SplashUiState extends State<SplashUi> {
  SharedPreferences sharedPreferences;
  CartProvider cartProvider;
  init()async
  {
    await Future.delayed(Duration(milliseconds: 100));
    cartProvider=Provider.of<CartProvider>(context,listen:false);
    cartProvider.clearLocalDb();
    print('dede');
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SharedPreferences.getInstance().then((sp) => {
      sharedPreferences=sp,
      print('${sharedPreferences.getString('showslider')},tokekek'),
      if(sharedPreferences.getString('showslider')!=null)
        {
          Timer(Duration(seconds: 3), ()=>
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                  HomePageUI()), (Route<dynamic> route) => false))
        }
      else{
        init(),
        Timer(Duration(seconds: 3), ()=>Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
    IntroSliderUI()), (Route<dynamic> route) => false),)
      }

    });


  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Stack(overflow: Overflow.visible,children: [
      widget.backWidget,
      Center(
        child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,children: [
             Expanded(flex: 4,child: SizedBox()),
          Image.asset(widget.logoPath,width: MediaQuery.of(context).size.width * 0.6,

            height:  MediaQuery.of(context).size.width * 0.47,),
          Expanded(flex:3,child: SizedBox()),
          Text(DemoLocalizations.of(context).title['first_title_intro'],style: TextStyle(fontWeight: FontWeight.bold,
          color: Theme.of(context).accentColor),),
          Text(DemoLocalizations.of(context).title['second_title_intro'],style: TextStyle(
              color: Theme.of(context).accentColor),),
          Expanded(flex: 1,child: SizedBox()),

        ],),
      )
    ],),));
  }
}
