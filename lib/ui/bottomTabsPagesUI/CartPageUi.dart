import 'package:elmasreenapp/core/providermodels/CartProvider.dart';
import 'package:elmasreenapp/ui/ButtonCartUi.dart';
import 'package:elmasreenapp/ui/layout/MainPartCartLayout.dart';
import 'package:elmasreenapp/ui/layout/commonAppBarTopUi.dart';
import 'package:elmasreenapp/utils/app_Localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class CartPageUi extends StatelessWidget {
  final Function function;

  const CartPageUi({Key key, this.function}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Column(children: [
      CommonAppBarTopUi(function:function ,title: DemoLocalizations.of(context).title['cart'],),
       Expanded(
        child:MainPartCartLayout(),
      )
    ],),));
  }
}
