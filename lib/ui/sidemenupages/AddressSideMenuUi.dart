import 'package:elmasreenapp/ui/layout/CommonAppBarUi.dart';
import 'package:elmasreenapp/ui/layout/MainPartAddressLayout.dart';
import 'package:elmasreenapp/utils/app_Localization.dart';
import 'package:flutter/material.dart';
 class AddressSideMenuUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(appBar: PreferredSize(child: commonAppBarUi(
        DemoLocalizations.of(context).title['Myaddresses'],context),
        preferredSize: Size.fromHeight(50.0),),
      body:  Container(width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.05),
          child: MainPartAddressLayout(),
             ),
      ));
  }

}
