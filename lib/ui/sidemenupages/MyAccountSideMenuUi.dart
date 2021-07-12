import 'package:elmasreenapp/ui/layout/CommonAppBarUi.dart';
import 'package:elmasreenapp/ui/layout/MainPartMyAccountLayout.dart';
import 'package:elmasreenapp/utils/app_Localization.dart';
 import 'package:flutter/material.dart';
class MyAccountSideMenuUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(
      appBar:PreferredSize(child:  commonAppBarUi(
      DemoLocalizations.of(context).title['personaldata'],
      context
    ),
        preferredSize: Size.fromHeight(50),),
    body: MainPartMyAccountLayout(),));
  }
}

