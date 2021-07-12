 import 'package:elmasreenapp/ui/layout/MainPartSettingsLayout.dart';
import 'package:elmasreenapp/ui/layout/commonAppBarTopUi.dart';
import 'package:elmasreenapp/utils/app_Localization.dart';
import 'package:flutter/material.dart';
class SettingsPageUi extends StatelessWidget {
  final Function function;

  const SettingsPageUi({Key key, this.function}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(children: [

      CommonAppBarTopUi(function:function ,title: DemoLocalizations.of(context).title['settings'],),
      Expanded(child: MainPartSettingsLayout())
    ],);
  }
}
