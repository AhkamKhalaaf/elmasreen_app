import 'package:elmasreenapp/ui/layout/CommonAppBarUi.dart';
import 'package:elmasreenapp/ui/layout/MainPartFvoriteLayout.dart';
import 'package:elmasreenapp/utils/app_Localization.dart';
import 'package:flutter/material.dart';
class FavoriteSideMenuUi extends StatefulWidget {
  @override
  _FavoriteSideMenuUiState createState() => _FavoriteSideMenuUiState();
}

class _FavoriteSideMenuUiState extends State<FavoriteSideMenuUi> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(appBar: PreferredSize(child: commonAppBarUi(
      DemoLocalizations.of(context).title['favorite'],
      context
    ),
        preferredSize: Size.fromHeight(50),),body: MainPartFavoriteLayout(),));
  }
}
