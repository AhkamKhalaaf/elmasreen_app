import 'package:dotted_border/dotted_border.dart';
import 'package:elmasreenapp/utils/app_Localization.dart';
import 'package:flutter/material.dart';

import '../HomePageUI.dart';
import 'NoDataFoundLayout.dart';
class NoProductFoundUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NoDataFoundLayout(spaceOrNot: true,imagePath: 'assets/images/nologhistory.png',
        title: DemoLocalizations.of(context).title['nologdata'],
        widget:SizedBox());
  }
}
