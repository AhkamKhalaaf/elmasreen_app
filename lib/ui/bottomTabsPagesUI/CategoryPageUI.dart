import 'package:elmasreenapp/ui/layout/MainPartCategoryLayout.dart';
import 'package:elmasreenapp/ui/layout/commonAppBarTopUi.dart';
import 'package:elmasreenapp/utils/app_Localization.dart';
import 'package:flutter/material.dart';
class CategoryPageUI extends StatelessWidget {
  final Function function;

  const CategoryPageUI({Key key, this.function}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body:  Container(color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,children: [

        CommonAppBarTopUi(title: DemoLocalizations.of(context).title['sections'],
            function: function),
        Expanded(child: MainPartCategoryLayout())



      ],),
    ),));
  }
}
