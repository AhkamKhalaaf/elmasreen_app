import 'package:elmasreenapp/ui/layout/CommonAppBarUi.dart';
import 'package:elmasreenapp/ui/stepspages/CustomAppBarFollowUi.dart';
import 'package:elmasreenapp/utils/app_Localization.dart';
import 'package:flutter/material.dart';

import 'loghistorypages/MainPartLogUi.dart';
class LogOrdersSideMenuUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 5,
      child: SafeArea(child: Scaffold(appBar:PreferredSize(child:  CustomAppBarFollowUi(
        title: DemoLocalizations.of(context).title['OrderHistory'],
      ),
          preferredSize: Size.fromHeight(50),),
        body: Column(children: [
          Container(decoration: BoxDecoration(color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.25),
                spreadRadius: 1,
                blurRadius:3,
                offset:
                Offset(0, 5), // changes position of shadow
              ),
            ],
            ),
            child: TabBar(isScrollable: true,labelStyle: TextStyle(fontSize: 14.0,fontFamily: 'mainfont'),labelColor:Theme.of(context).primaryColor,
                unselectedLabelColor: Colors.grey.withOpacity(0.5),
                indicator: BoxDecoration(border: Border.all(color: Colors.white,width: 0.0)),
                tabs: [
              Tab(text: DemoLocalizations.of(context).title['current']),
              Tab(text: DemoLocalizations.of(context).title['accepted'],),
              Tab(text: DemoLocalizations.of(context).title['shipping'],),
                  Tab(text: DemoLocalizations.of(context).title['Delivered'],),
                  Tab(text: DemoLocalizations.of(context).title['cancelled'],)
            ]),
          ),
           SizedBox(height: MediaQuery.of(context).size.width*0.025,),
           Expanded(
            child: TabBarView(children: [
              MainPartLogUi(urlValue: '1',),//pending
              MainPartLogUi(urlValue: '2',),//accepted
              MainPartLogUi(urlValue: '4',),//shippe
              MainPartLogUi(urlValue: '5',),//delivered
              MainPartLogUi(urlValue: '6',)//cancelled

            ]),
          )
        ],),
      ),),
    );
  }
}
