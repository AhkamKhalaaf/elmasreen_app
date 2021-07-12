import 'package:elmasreenapp/core/models/OrderUserModel.dart';
import 'package:elmasreenapp/core/providermodels/CartProvider.dart';
import 'package:elmasreenapp/core/providermodels/LogProvider.dart';
import 'package:elmasreenapp/ui/LoadingUi.dart';
import 'package:elmasreenapp/ui/layout/NoProductFoundUI.dart';
import 'package:elmasreenapp/ui/widgets/TimeLineContentUi.dart';
import 'package:elmasreenapp/utils/app_Localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'LogItemWidget.dart';

class MainPartLogUi extends StatefulWidget {
  final String urlValue;

  const MainPartLogUi({Key key, this.urlValue}) : super(key: key);

  @override
  _MainPartLogUiState createState() => _MainPartLogUiState();
}

class _MainPartLogUiState extends State<MainPartLogUi> {
  CartProvider _cartProvider;
  initCall()async
  {
    _cartProvider=Provider.of<CartProvider>(context,listen: false);
    _cartProvider.getOrderUserData(widget.urlValue);
  }
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    //  const kTileHeight = 50.0;
    return Consumer<CartProvider>(builder: (context, cartProvider, widgetUi) {
      return SingleChildScrollView(
        child: FutureBuilder(
            future: cartProvider.getOrderUserData(widget.urlValue),
            builder: (context, snapShot) {
           //   print('${snapShot.data},,,,,sas');
              if(snapShot.hasData)
                {List<UserOrder>itemsData=snapShot.data;
                if(itemsData.length>0)
                  {
                    return ListView.builder(shrinkWrap: true,primary: false,itemCount: itemsData.length,itemBuilder: (context,index){
                      return itemsData[index].orderProducts.length>0?Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.25),
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                  offset: Offset(0, 5), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(8.0)),
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.width * 0.05,
                              left: MediaQuery.of(context).size.width * 0.05,
                              right: MediaQuery.of(context).size.width * 0.05),
                          padding:
                          EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                itemsData[index].address,
                                style: TextStyle(color: Theme.of(context).primaryColor),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              ListView.builder(
                                   shrinkWrap: true,primary: false,
                                  itemCount: itemsData[index].orderProducts.length,
                                  itemBuilder: (context, i) {
                                    return LogItemWidget(orderProduct: itemsData[index].orderProducts[i],);
                                  }),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(DemoLocalizations.of(context).title['Totaldemand'],
                                      style: TextStyle(
                                          color: Colors.black87, fontSize: 16.0)),
                                  Text(
                                    '${itemsData[index].totalPrice.toString()} ${DemoLocalizations.of(context).title['currency']}',
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 16.0),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                            ],
                          )):SizedBox();
                    });
                  }
                else{
                  return Container(alignment: Alignment.center,width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height ,child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          NoProductFoundUI(),
                          SizedBox(height:40.0,)
                        ],
                      ));
                }
               }

              return Container(alignment: Alignment.center, width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LoadingUi(),
                      SizedBox(height:140.0,)

                    ],
                  ));

            }),
      );
//        Visibility(visible: logProvider.clickStatus,
//          child: GestureDetector(onTap: (){
//            logProvider.showStatus();
//          },
//            child: Container(
//              margin: EdgeInsets.only( left: MediaQuery.of(context).size.width * 0.05,
//                  right: MediaQuery.of(context).size.width * 0.05),padding: EdgeInsets.all(5.0),child:Row(
//              crossAxisAlignment: CrossAxisAlignment.center,
//              mainAxisAlignment: MainAxisAlignment.center,children: [
//              Text(DemoLocalizations.of(context).title['Orderstatus'],style:Theme.of(context).textTheme.headline2),
//              Icon(Icons.keyboard_arrow_down,color: Colors.black54,)
//            ],) ,width: MediaQuery.of(context).size.width - 0.1,
//              decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomRight:Radius.circular(8.0),
//                  bottomLeft:Radius.circular(8.0) ),
//                  color:weightColorGrey),),
//          ),
//        ),
//        Visibility(visible: logProvider.logStatus,
//          child: Expanded(
//            child: Container(padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05,
//                right: MediaQuery.of(context).size.width * 0.05)
//              ,margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05,
//                right: MediaQuery.of(context).size.width * 0.05,
//              ),decoration: BoxDecoration(
//                  color:weightColorGrey,borderRadius: BorderRadius.only(bottomLeft:Radius.circular(8.0),
//                  bottomRight:Radius.circular(8.0))),
//              child: Column(
//                children: [
//                  Expanded(
//                    child: Timeline.tileBuilder(
//                      theme: TimelineThemeData(
//                        nodePosition: 0,
//                        connectorTheme: ConnectorThemeData(
//                          thickness: 1.5,
//                          color:darkColorUsed,
//                        ),
//                        indicatorTheme: IndicatorThemeData(
//                            size: 15.0,color: Colors.black
//                        ),
//                      ),
//                      // padding: EdgeInsets.symmetric(vertical: 20.0),
//                      builder: TimelineTileBuilder.connected(
//                        contentsBuilder: (_, index) =>index==0? TimeLineContentUi(
//                            paddingTop: 0.0,title: title[index],time: '12 pm',
//                            color: Theme.of(context).accentColor):
//                        TimeLineContentUi(paddingTop: 20.0,title: title[index],time: 'am 12',
//                            color: Colors.grey),
//                        connectorBuilder: (_, index, __) {
//                          if (index == 0) {
//                            return SolidLineConnector(color:darkColorUsed);
//                          } else {
//                            return SolidLineConnector(color: Colors.grey,);
//                          }
//                        },
//                        indicatorBuilder: (_, index) {
//                          switch (data[index]) {
//                            case _TimelineStatus.done:
//                              return DotIndicator(size: 20.0,
//                                color:darkColorUsed,
//                                child: Icon(
//                                  Icons.check,
//                                  color: Colors.white,
//                                  size: 15.0,
//                                ),
//                              );
//
//                            case _TimelineStatus.sync:
//                              return Column(
//                                children: [
//                                  SizedBox(
//                                    height: 20.0,
//                                    child: DashedLineConnector(color:Colors.grey,indent:2,),
//                                  ),
//                                  DotIndicator(size:20.0,
//                                    color: Colors.grey,
//                                    child: Icon(
//                                      Icons.sync,
//                                      size: 15.0,
//                                      color: Colors.grey,
//                                    ),
//                                  ),
//
//                                ],
//                              );
//                            case _TimelineStatus.inProgress:
//                              return Column(
//                                children: [
//                                  SizedBox(
//                                    height: 20.0,
//                                    child: DashedLineConnector(color:Colors.grey),
//                                  ),
//                                  DotIndicator(size:20.0,
//                                    color: Colors.grey,
//                                    child: Icon(
//                                      Icons.sync,
//                                      size: 15.0,
//                                      color: Colors.grey,
//                                    ),
//                                  ),
//
//                                ],
//                              );
//                            case _TimelineStatus.todo:
//                            default:
//                              return Column(
//                                children: [
//                                  SizedBox(
//                                    height: 20.0,
//                                    child: DashedLineConnector(color: Colors.grey),
//                                  ),
//                                  DotIndicator(size:20.0,
//                                    color: Colors.grey,
//                                    child: Icon(
//                                      Icons.sync,
//                                      size: 15.0,
//                                      color: Colors.grey,
//                                    ),
//                                  ),
//
//                                ],
//                              );
//                          }
//                        },
//                        itemExtentBuilder: (_, __) => kTileHeight,
//                        itemCount: data.length,
//                      ),
//                    ),
//                  ),
//                  GestureDetector(onTap: (){
//                    logProvider.hideStatus();
//                  },child: Icon(Icons.keyboard_arrow_up,color: Colors.black,)),
//                  SizedBox(height: MediaQuery.of(context).size.width * 0.025,)
//
//
//                ],
//              ),
//            ),
//          ),
//        ),
//        SizedBox(height: MediaQuery.of(context).size.width * 0.05,)
    });
  }
}
//enum _TimelineStatus {
//  done,
//  sync,
//  inProgress,
//  todo,
//}
