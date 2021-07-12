import 'dart:async';

import 'package:elmasreenapp/ui/componentui/ButtonUi.dart';
import 'package:elmasreenapp/ui/layout/TextCartUi.dart';
import 'package:elmasreenapp/ui/sidemenupages/LogOrdersSideMenuUi.dart';
import 'package:elmasreenapp/utils/app_Localization.dart';
import 'package:flutter/material.dart';
import '../../Values.dart';
import '../HomePageUI.dart';
 class SuccessPageUi extends StatefulWidget {
  final Map<String,dynamic>map;

  const SuccessPageUi({Key key, this.map}) : super(key: key);

  @override
  _SuccessPageUiState createState() => _SuccessPageUiState();
}

class _SuccessPageUiState extends State<SuccessPageUi> {

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds:5), ()=>Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
        HomePageUI()), (Route<dynamic> route) => false),);
  }

   @override
  Widget build(BuildContext context) {
    return SafeArea(child: WillPopScope(onWillPop: ()async{
      backStepsFunction(context);

      return true;
    },
      child: Scaffold(body: Container(
        width: MediaQuery.of(context).size.width,
        child:  Column(children: [
           Expanded(
            child: Container(padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.05),
              child: Column(
                children: [
//                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    crossAxisAlignment: CrossAxisAlignment.center,children: [
//                      Image.asset('assets/icons/step4.png',width: 35.0,height: 35.0,),
//
//
//                      Expanded(
//                        child:DottedLine(dashColor: Colors.grey,dashGapLength: 1.0,),
//
//                      ),
//                      Image.asset('assets/icons/step4.png',width: 35.0,height: 35.0,),
//                      Expanded(
//                        child:DottedLine(dashColor: Colors.grey,dashGapLength: 1.0,),
//
//                      ),
//                      Image.asset('assets/icons/step4.png',width: 35.0,height: 35.0,),
//                      Expanded(
//                        child:DottedLine(dashColor: Colors.grey,dashGapLength: 1.0,),
//
//                      ),
//                      Image.asset('assets/icons/step4.png',width: 35.0,height: 35.0,),
//
//
//
//
//                    ],),
//                  SizedBox(height:8.0,),
//                  Row(children: [
//                    Text(DemoLocalizations.of(context).title['details'],
//                        style: Theme.of(context).textTheme.headline4),
//                    Expanded(child: SizedBox()),
//                    Text(DemoLocalizations.of(context).title['address'],
//                        style: Theme.of(context).textTheme.headline4),
//                    Expanded(child: SizedBox()),
//                    Text(DemoLocalizations.of(context).title['addresstype'],
//                        style: Theme.of(context).textTheme.headline4),
//                    Expanded(child: SizedBox()),
//                    Text(DemoLocalizations.of(context).title['check'],
//                        style: Theme.of(context).textTheme.headline4)
//                  ],),
                  SizedBox(height:30.0,),

                  Expanded(
                    child: Column( mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
                      Image.asset('assets/images/check.png',fit:BoxFit.fill,width: MediaQuery.of(context).size.width*0.4,
                        height: MediaQuery.of(context).size.width*0.4,),
                      Text(DemoLocalizations.of(context).title['operationaccomplishedsuccessfully'],
                        style: TextStyle(color: Theme.of(context).primaryColor,
                            fontSize: 20.0),),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(bottom: 5.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                                width: 1.0, color: Color(0xffE9E9E9))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Container(
                              height: 5.0,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              children: [
                                Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [

                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        TextCartUi(
                                          title:DemoLocalizations.of(context).title['Ordernumber']

                                        ),
                                        SizedBox(
                                          height: 3.0,
                                        ),
                                        Container(
                                          height: 1.0,
                                          color: Color(0xffE9E9E9),
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.25,
                                        ),

                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        TextCartUi(
                                          title: '${widget.map['orderDetails']['id']}',
                                        ),
                                        SizedBox(
                                          height: 3.0,
                                        ),
                                        Container(
                                          height: 1.0,
                                          color: Color(0xffE9E9E9),
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.25,
                                        ),

                                      ],
                                    ),

                                  ],
                                ),SizedBox(height: 5.0,),
                                Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [

                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        TextCartUi(
                                            title:'الكمية'

                                        ),
                                        SizedBox(
                                          height: 3.0,
                                        ),
                                        Container(
                                          height: 1.0,
                                          color: Color(0xffE9E9E9),
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.25,
                                        ),

                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        TextCartUi(
                                          title:   '${widget.map['orderDetails']['orderProductsQty']} ',
                                        ),
                                        SizedBox(
                                          height: 3.0,
                                        ),
                                        Container(
                                          height: 1.0,
                                          color: Color(0xffE9E9E9),
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.25,
                                        ),

                                      ],
                                    ),

                                  ],
                                ),SizedBox(height: 5.0,),
                                Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [

                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        TextCartUi(
                                            title:'سعر المنتجات'

                                        ),
                                        SizedBox(
                                          height: 3.0,
                                        ),
                                        Container(
                                          height: 1.0,
                                          color: Color(0xffE9E9E9),
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.25,
                                        ),

                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        TextCartUi(
                                          title: '${widget.map['orderDetails']['products_price']}'
                                              ' ${DemoLocalizations.of(context).title['currency']}',
                                        ),
                                        SizedBox(
                                          height: 3.0,
                                        ),
                                        Container(
                                          height: 1.0,
                                          color: Color(0xffE9E9E9),
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.25,
                                        ),

                                      ],
                                    ),

                                  ],
                                ),SizedBox(height: 5.0,),
                                Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [

                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        TextCartUi(
                                            title:'رسوم الدفع '

                                        ),
                                        SizedBox(
                                          height: 3.0,
                                        ),
                                        Container(
                                          height: 1.0,
                                          color: Color(0xffE9E9E9),
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.25,
                                        ),

                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        TextCartUi(
                                          title: '${widget.map['orderDetails']['payment_fees']}'
                                              ' ${DemoLocalizations.of(context).title['currency']}',
                                        ),
                                        SizedBox(
                                          height: 3.0,
                                        ),
                                        Container(
                                          height: 1.0,
                                          color: Color(0xffE9E9E9),
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.25,
                                        ),

                                      ],
                                    ),

                                  ],
                                ),SizedBox(height: 5.0,),

                                Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [

                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        TextCartUi(
                                            title:'رسوم الشحن'

                                        ),
                                        SizedBox(
                                          height: 3.0,
                                        ),
                                        Container(
                                          height: 1.0,
                                          color: Color(0xffE9E9E9),
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.25,
                                        ),

                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        TextCartUi(
                                          title:'${widget.map['orderDetails']['shipping_fees']} '
                                              '${DemoLocalizations.of(context).title['currency']}',
                                        ),
                                        SizedBox(
                                          height: 3.0,
                                        ),
                                        Container(
                                          height: 1.0,
                                          color: Color(0xffE9E9E9),
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.25,
                                        ),

                                      ],
                                    ),

                                  ],
                                ),SizedBox(height: 5.0,),
                                Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [

                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        TextCartUi(
                                            title:'رسوم الضريبة'

                                        ),
                                        SizedBox(
                                          height: 3.0,
                                        ),


                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        TextCartUi(
                                          title:'${widget.map['orderDetails']['tax_fees']}'
                                              ' ${DemoLocalizations.of(context).title['currency']}',
                                        ),
                                        SizedBox(
                                          height: 3.0,
                                        ),


                                      ],
                                    ),

                                  ],
                                ),SizedBox(height: 5.0,),
                              ],
                            ),
                          ],
                        ),
                      ),


                   Text('الإجمالي'+'  '+
                              '${widget.map['orderDetails']['total_price']} ${DemoLocalizations.of(context).title['currency']}',textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline6,),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ButtonUi(function: (){
                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                LogOrdersSideMenuUi()), (Route<dynamic> route) => false);
                          },doubleValue: MediaQuery.of(context).size.width*0.4,
                            backColor: Theme.of(context).accentColor,
                            widget: Text(DemoLocalizations.of(context).title['OrderHistory'],
                              style: TextStyle(color: Colors.white,
                                  fontSize: 14.0),
                            ),),
                          ButtonUi(function: (){
                            backStepsFunction(context);

                          },doubleValue: MediaQuery.of(context).size.width*0.4,
                            backColor: Theme.of(context).accentColor,
                            widget: Text('الرئيسية',
                              style: TextStyle(color: Colors.white,
                                  fontSize: 14.0),
                            ),),
                        ],
                      ),
                     ],),
                  ),

                  SizedBox(height:30.0,),

                ],),),
          )
        ],),


      ),),
    ));
  }
}