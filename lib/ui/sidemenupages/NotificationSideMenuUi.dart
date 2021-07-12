import 'dart:ui';

import 'package:elmasreenapp/core/models/notificationsModel.dart';
import 'package:elmasreenapp/core/providermodels/AccountProvider.dart';
import 'package:elmasreenapp/ui/LoadingUi.dart';
import 'package:elmasreenapp/ui/layout/CommonAppBarUi.dart';
import 'package:elmasreenapp/ui/layout/NoDataFoundLayout.dart';
import 'package:elmasreenapp/utils/app_Localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
class NotificationSideMenuUi extends StatefulWidget {
  @override
  _NotificationSideMenuUiState createState() => _NotificationSideMenuUiState();
}

class _NotificationSideMenuUiState extends State<NotificationSideMenuUi> {
  AccountProvider _accountProvider;
  iniCall()
  {
    _accountProvider=Provider.of<AccountProvider>(context,listen: false);
    _accountProvider.getNotificationsApi();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    iniCall();
  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(child: Scaffold(appBar: PreferredSize(
      child: commonAppBarUi(DemoLocalizations.of(context).title['notifications'],
        context
    ),preferredSize: Size.fromHeight(50),),
      body:dataUI(context)
    ),);
  }

  Widget dataUI(BuildContext context)
  {
   // List<bool>itmes=[true,false,true,false,false];
    return  Container(width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.width*0.05),
      child: Consumer<AccountProvider>(builder: (context,accountProvider,widgetUi){
        return FutureBuilder(future:accountProvider.getNotificationsApi() ,builder: (context,snapShot){
        //  print('${snapShot.data}');
          if(snapShot.hasData)
            {
              List<NotificationItemModel>items=snapShot.data;
              if(items.length>0)
                {return ListView.builder(itemCount: 5,itemBuilder: (context,index){
                  return   Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(color: Colors.grey.withOpacity(0.2) ,alignment: Alignment.center
                        ,padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05,
                            right: MediaQuery.of(context).size.width*0.05,
                            top: MediaQuery.of(context).size.width*0.025,
                            bottom: MediaQuery.of(context).size.width*0.025),child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end
                          ,children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,children: [
                          //  itmes[index]? Icon(FontAwesomeIcons.checkCircle,color: Colors.red,size:30.0,):
                            Icon(FontAwesomeIcons.exclamationCircle,color: Colors.amber,size:30.0,),
                            SizedBox(width: 8.0,),
                            Expanded(child: Column(mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,children: [
                                Text(items[index].title.toString(),style: TextStyle(color:Theme.of(context).primaryColor,fontSize: 12.0),),

                                Text(items[index].text.toString()
                                  ,style: Theme.of(context).textTheme.headline3,)
                              ],)),
                            SizedBox(width: 25.0,),

//                            Row(children: [
//                              itmes[index]? Container(width: 4.0,height:4.0,decoration: BoxDecoration(
//                                  color: Theme.of(context).primaryColor,borderRadius: BorderRadius.circular(30.0)),):SizedBox(),
//                              Icon(Icons.arrow_forward_ios,size:15.0,color:Colors.grey,)
//                            ],)
                          ],),
                          SizedBox(height:5.0,),

                          Directionality(textDirection: TextDirection.ltr,child: Text(items[index].dateTime.toString(),style: Theme.of(context).textTheme.headline3,)),

                        ],),),
Container(color: Colors.white,height: 1.0,)
//                      !itmes[index]?Container(width: MediaQuery.of(context).size.width,
//                        height: 1.0,color: Colors.grey.withOpacity(0.5),):SizedBox()
                    ],
                  )
                  ;
                });}
              else
                {
                  return noData(context);
                }

              }
          return LoadingUi();

        });
      },));
  }

  Widget noData(BuildContext context)
  {
    return NoDataFoundLayout(spaceOrNot: false,imagePath:'assets/images/nonotification.png' ,
      title: DemoLocalizations.of(context).title['nonotification'],
      widget: SizedBox(height: 1.0,),);
  }
}
