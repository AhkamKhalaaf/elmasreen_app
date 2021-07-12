import 'package:dotted_line/dotted_line.dart';
import 'package:elmasreenapp/core/providermodels/AccountProvider.dart';
import 'package:elmasreenapp/ui/componentui/ButtonUi.dart';
import 'package:elmasreenapp/ui/layout/DataAccountLayout.dart';
import 'package:elmasreenapp/utils/app_Localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../Values.dart';
import 'AddressPageStepPageUI.dart';
import 'CustomAppBarFollowUi.dart';

class DetailsPageUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: WillPopScope(
      onWillPop: () async {
        backStepsFunction(context);

        return true;
      },
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBarFollowUi(
                title:
                    DemoLocalizations.of(context).title['followupwiththeorder'],
              ),
              Container(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(child: Icon(Icons.person,color: Colors.white,
                            size: 25.0,),width: 40.0,height: 40.0,decoration: BoxDecoration(
                            color:Theme.of(context).primaryColor,shape:BoxShape.circle),),
                            SizedBox(height: 5.0,),
                            Text('المستخدم',
                                style: Theme.of(context).textTheme.headline2.copyWith(fontSize:11.0,
                                fontWeight: FontWeight.w600,color: Colors.black),
                                textAlign: TextAlign.center),
                          ],
                        ),
                        Expanded(
                          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DottedLine(
                                dashColor: Colors.black87,lineThickness: 2.0 ,
                                dashGapLength: 1.50,dashRadius:1.0,
                              ),
                              SizedBox(height:15.0,)
                            ],
                          ),
                        ),
                        Column(crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        Container(child: Icon(FontAwesomeIcons.mapMarkerAlt,color: Colors.white,
                          size: 20,),width:40.0,height: 40.0,decoration: BoxDecoration(
                  color:Colors.grey,shape:BoxShape.circle),),    SizedBox(height: 5.0,),
                            Text('العنوان',
                                style: Theme.of(context).textTheme.headline2.copyWith(fontSize: 12.0,
                                    fontWeight: FontWeight.w600),
                                textAlign: TextAlign.center),
                          ],
                        ),
                        Expanded(
                          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DottedLine(
                                dashColor: Colors.black87,lineThickness: 2.0 ,
                                dashGapLength: 1.50,dashRadius:1.0,
                              ),
                              SizedBox(height:15.0,)
                            ],
                          ),
                        ),
                        Column(crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(child: Icon(Icons.local_shipping_rounded,color: Colors.white,
                              size: 20.0,),width: 40.0,height: 40.0,decoration: BoxDecoration(
                                color:Colors.grey,shape:BoxShape.circle),),    SizedBox(height: 5.0,),
                            Text('الشحن',
                                style: Theme.of(context).textTheme.headline2.copyWith(fontSize: 12.0,
                                    fontWeight: FontWeight.w600),
                                textAlign: TextAlign.right),
                          ],
                        ),
                        Expanded(
                          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DottedLine(
                                dashColor: Colors.black87,lineThickness: 2.0 ,
                                dashGapLength: 1.50,dashRadius:1.0,
                              ),
                              SizedBox(height:15.0,)
                            ],
                          ),
                        ),
                        Column(crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(child: Icon(Icons.payment,color: Colors.white,
                              size: 20.0,),width: 40.0,height: 40.0,decoration: BoxDecoration(
                                color:Colors.grey,shape:BoxShape.circle),),   SizedBox(height: 5.0,),
                            Text('الدفع',
                                style: Theme.of(context).textTheme.headline2.copyWith(fontSize: 12.0,fontWeight: FontWeight.w600),
                                textAlign: TextAlign.center),
                          ],
                        ),
                        Expanded(
                          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DottedLine(
                                dashColor: Colors.black87,lineThickness: 2.0 ,
                                dashGapLength: 1.50,dashRadius:1.0,
                              ),
                              SizedBox(height:15.0,)
                            ],
                          ),
                        ),
                        Column(crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(child: Icon(Icons.check,color: Colors.white,
                              size: 25.0,),width:40.0,height: 40.0,decoration: BoxDecoration(
                                color:Colors.grey,shape:BoxShape.circle),),    SizedBox(height: 5.0,),
                            Text('التأكيد',
                                style: Theme.of(context).textTheme.headline2.copyWith(fontSize: 12.0,fontWeight: FontWeight.w600),
                                textAlign: TextAlign.center),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Divider(
                      thickness: 1.0,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    SizedBox(height: 10.0),
                    Consumer<AccountProvider>(
                        builder: (context, account, widget) {
                      return Column(
                        children: [
                          Stack(
                            overflow: Overflow.visible,
                            children: [
                              Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100.0),
                                    border: Border.all(
                                        width: 5.0,
                                        color: Theme.of(context).primaryColor)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100.0),
                                  child: FadeInImage.assetNetwork(
                                      placeholder: 'assets/images/looding.gif',
                                      fit: BoxFit.cover,
                                      width: 130.0,
                                      height: 130.0,
                                      image: account.imageUser),
                                ),
                              ),
                            ],
                          ),

                          // SizedBox(height: 15.0,),
                          Container(
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.width * 0.04),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Divider(
                                  thickness: 1.0,
                                  color: Colors.grey.withOpacity(0.5),
                                ),
                                SizedBox(
                                  height: 25.0,
                                ),
                                DataAccountLayout(
                                  title1: DemoLocalizations.of(context)
                                      .title['name'],
                                  title2: account.nameUser,
                                ),
                                SizedBox(
                                  height: 25.0,
                                ),
                                DataAccountLayout(
                                  title1: DemoLocalizations.of(context)
                                      .title['PhoneNumber'],
                                  title2: account.phoneUser,
                                ),
                                SizedBox(
                                  height: 25.0,
                                ),
                                DataAccountLayout(
                                  title1: DemoLocalizations.of(context)
                                      .title['email'],
                                  title2: account.emailUser,
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
                    SizedBox(
                      height: 20.0,
                    ),
                    ButtonUi(
                      widget: Text(
                        DemoLocalizations.of(context).title['next'],
                        style: TextStyle(color: Colors.white),
                      ),
                      backColor: Theme.of(context).accentColor,
                      function: () {
                        //                 Navigator.pushReplacement(
//                     context, MaterialPageRoute(builder: (BuildContext context) => AddressPageStepPageUI()),);

                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) =>
                                AddressPageStepPageUI(),
                            transitionDuration: Duration(seconds: 0),
                          ),
                        );
                      },
                      doubleValue: MediaQuery.of(context).size.width * 0.8,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
