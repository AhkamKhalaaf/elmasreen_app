import 'package:elmasreenapp/ui/layout/CommonAppBarUi.dart';
import 'package:elmasreenapp/ui/layout/MainPartCategoryLayout.dart';
import 'package:elmasreenapp/utils/app_Localization.dart';
import 'package:flutter/material.dart';
class CategorySideMenuUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
       return SafeArea(child: Scaffold(appBar:PreferredSize(child:  commonAppBarUi(
         DemoLocalizations.of(context).title['department'],
         context

       ),
           preferredSize: Size.fromHeight(50),),
      body: MainPartCategoryLayout(),
    ),);
  }
}
