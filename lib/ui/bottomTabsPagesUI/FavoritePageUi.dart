 import 'package:elmasreenapp/core/providermodels/CartProvider.dart';
import 'package:elmasreenapp/ui/ButtonCartUi.dart';
import 'package:elmasreenapp/ui/layout/MainPartFvoriteLayout.dart';
import 'package:elmasreenapp/ui/layout/commonAppBarTopUi.dart';
import 'package:elmasreenapp/utils/app_Localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class FavoritePageUi extends StatefulWidget {
  final Function function;

  const FavoritePageUi({Key key, this.function}) : super(key: key);

  @override
  State<FavoritePageUi> createState() => _FavoritePageUiState();
}

class _FavoritePageUiState extends State<FavoritePageUi> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CommonAppBarTopUi(title:DemoLocalizations.of(context).title['favorite'] ,function: widget.function,),

      Expanded(child: MainPartFavoriteLayout())
    ],);
  }
}
