import 'package:dotted_line/dotted_line.dart';
 import 'package:elmasreenapp/ui/componentui/ButtonUi.dart';
import 'package:elmasreenapp/ui/layout/MainPartAddressLayout.dart';
import 'package:elmasreenapp/utils/app_Localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
 import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

import '../../Values.dart';
import 'CustomAppBarFollowUi.dart';
import 'ShippingTypePageUi.dart';
class AddressPageStepPageUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: WillPopScope(onWillPop: ()async{
      backStepsFunction(context);
      return true;
    },
      child: Scaffold(body:
       Column(children: [
        CustomAppBarFollowUi(title: DemoLocalizations.of(context).title['followupwiththeorder'],),
      Expanded(child:   Container(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.05),width: MediaQuery.of(context).size.width,
        child: Column(children: [

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
                      color:Theme.of(context).primaryColor,shape:BoxShape.circle),),    SizedBox(height: 5.0,),
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
          SizedBox(height: 15.0),
          Expanded(child: MainPartAddressLayout()),
          SizedBox(height:20.0),
//selectedId
          ButtonUi(widget: Text(DemoLocalizations.of(context).title['next'],style: TextStyle(color: Colors.white),),
            backColor: Theme.of(context).accentColor,
            function: ()async{
              //AddressPageStepPageUI
//              Navigator.pushReplacement(
//                  context, MaterialPageRoute(builder: (BuildContext context) => DeliveryTypePageUi()));

            SharedPreferences sh = await SharedPreferences.getInstance();
          //  print('${sh.getString('selectedId')},,,,,dsdsdsd');
              if(sh.getString('selectedId')!=null)
              {
                Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => ShippingTypePageUi(),
                  transitionDuration: Duration(seconds: 0),
                ),
              );
              }
              else
              {
                Toast.show(
                    DemoLocalizations.of(context).title['choosaddress'],
                    context,
                    duration: Toast.LENGTH_LONG,
                    gravity: Toast.BOTTOM);
              }

            },
            doubleValue: MediaQuery.of(context).size.width*0.9,)
        ],),))
      ],)),
    ));
  }
}
