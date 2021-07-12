import 'package:elmasreenapp/ui/layout/CommonAppBarUi.dart';
import 'package:elmasreenapp/ui/layout/MainPartCartLayout.dart';
import 'package:elmasreenapp/utils/app_Localization.dart';
import 'package:flutter/material.dart';
class CartSideMenuUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(backgroundColor: Colors.white,appBar: PreferredSize(child: commonAppBarUi(
      DemoLocalizations.of(context).title['shoppingCart'],
      context
    ),
        preferredSize: Size.fromHeight(50),),
      body: MainPartCartLayout(),
    ),);
  }
}
