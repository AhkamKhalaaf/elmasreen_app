import 'package:elmasreenapp/ui/layout/MainPartOfferLayout.dart';
import 'package:elmasreenapp/ui/layout/commonAppBarTopUi.dart';
import 'package:elmasreenapp/utils/app_Localization.dart';
import 'package:flutter/material.dart';
class OffersPageUi extends StatelessWidget {
  final Function function;

  const OffersPageUi({Key key, this.function}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body:  Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,children: [

        CommonAppBarTopUi(title: DemoLocalizations.of(context).title['Offers'],
            function: function),
        Expanded(child: MainPartOfferLayout())



      ],),
    ),));
  }
}
