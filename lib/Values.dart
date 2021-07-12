
import 'package:elmasreenapp/core/providermodels/AccountProvider.dart';
import 'package:elmasreenapp/core/providermodels/CartProvider.dart';
import 'package:elmasreenapp/ui/HomePageUI.dart';
import 'package:elmasreenapp/ui/componentui/ButtonUi.dart';
import 'package:elmasreenapp/utils/app_Localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
 import 'ui/componentui/PriceOdePriceUI.dart';
import 'package:elmasreenapp/core/models/HomeProductsCategoryModel.dart';

import 'ui/componentui/WriteNoteDetailsUi.dart';

 //const String urlBase = "http://entshr.com/pos-retails/api";
//const String urlBase = "http://entshr.com/pos-retails/el-masreen/api";
const String urlBase = "http://www.elmasren.com/app/api";

const Map<String, String> headersMapWithOutToken = {
  "lang":"ar"
};
const Map<String, String> headersMapContentType = {
  "lang":"ar",
  "Content-Type":"application/json"
};
//Content-Type
Future<Map<String,String>>headerWithTokenOrder()async
{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  Map<String,String>header={
    "lang":"ar",
    "Authorization":'Bearer '+sharedPreferences.getString('token'),
    'Content-Type':'application/json'
  };
  return header;
}
Future<Map<String,String>>headerWithToken()async
{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  Map<String,String>header={
    "lang":"ar",
    "Authorization":'Bearer '+sharedPreferences.getString('token')
  };
  return header;
}
final backButtonColor = Color(0xff32A747);
final iconSideMenuColor = Color(0xff1B173D);
final skipColorText = Color(0xff6FD581);
final int smsType=1;
final weightColorGrey=Color(0xfff3f3f3);
final darkColorUsed=Color(0xff128226);
final colorIcon=Colors.grey.withOpacity(0.5);
showBottomSheetFunction(BuildContext context, Function function) {
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05,
                      right: MediaQuery.of(context).size.width * 0.05,
                      top: MediaQuery.of(context).size.width * 0.05),
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        DemoLocalizations.of(context)
                            .title['Doyouwanttodeletetheitem'],
                        style: TextStyle(color: Colors.black54),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ButtonUi(
                            function: () async {
                              await function();
                            },
                            widget: Text(
                              DemoLocalizations.of(context).title['confirm'],
                              style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                            backColor: Theme.of(context).primaryColor,
                            doubleValue: MediaQuery.of(context).size.width * 0.38,
                          ),
                          ButtonUi(
                            function: () {
                              Navigator.of(context).pop();
                            },
                            widget: Text(
                              DemoLocalizations.of(context).title['cancell'],
                              style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                            backColor: Colors.red,
                            doubleValue: MediaQuery.of(context).size.width * 0.38,
                          ),
                        ],
                      )
                    ],
                  ));
            });
      });
}
showBottomSheetAddressFunction(BuildContext context, Function updateFunction,Function deleteFunction) {
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return Container(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05,
                  right: MediaQuery.of(context).size.width * 0.05,
                  top: MediaQuery.of(context).size.width * 0.05),
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ButtonUi(
                        function: () async {
                          await updateFunction();
                        },
                        widget: Text(
                          DemoLocalizations.of(context).title['edit'],
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        backColor: Theme.of(context).primaryColor,
                        doubleValue: MediaQuery.of(context).size.width * 0.38,
                      ),
                      ButtonUi(
                        function: ()async {
                          await deleteFunction();
                        },
                        widget: Text(
                          DemoLocalizations.of(context).title['delete'],
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        backColor: Colors.red,
                        doubleValue: MediaQuery.of(context).size.width * 0.38,
                      ),
                    ],
                  )
                ],
              ));
        });
      });
}

//showAllDetailsProductFunction(
//    BuildContext context, ProductsCategory oneProductModel, int newQuantity) {
//  final textValue = TextEditingController();
//   showDialog(
//      context: context,
//      builder: (BuildContext context) =>
//          StatefulBuilder(builder: (context, setState) {
//            return Scaffold(
//              backgroundColor: Colors.transparent,
//              body: Consumer<CartProvider>(
//                builder: (context, cartProvider, widget) {
//                  return Container(
//                    width: MediaQuery.of(context).size.width,
//                    height: MediaQuery.of(context).size.height,
//                    decoration: BoxDecoration(
//                      color: Colors.white,
//                    ),
//                    child: Column(
//                      mainAxisAlignment: MainAxisAlignment.start,
//                      crossAxisAlignment: CrossAxisAlignment.center,
//                      children: [
//                        Container(
//                          decoration: BoxDecoration(boxShadow: [
//                            BoxShadow(
//                               color: Colors.grey.withOpacity(0.25),
//                              spreadRadius: 1,
//                              blurRadius: 3,
//                              offset:
//                                  Offset(0, 5), // changes position of shadow
//                            ),
//                          ], color: Colors.white),
//                          width: MediaQuery.of(context).size.width,
//                          height: 50.0,
//                          child: Row(
//                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                            children: [
//                              IconButton(
//                                  icon: Icon(
//                                    Icons.arrow_back_ios,
//                                    color: Colors.black,
//                                  ),
//                                  onPressed: () {
//                                    Navigator.of(context).pop();
//                                  }),
//
//                            ],
//                          ),
//                        ),
//                        Expanded(
//                            child: SingleChildScrollView(
//                          child: Container(color: Colors.white,
//                            margin: EdgeInsets.only(top:MediaQuery.of(context).size.width * 0.05 ),
//                            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05,
//                            right: MediaQuery.of(context).size.width * 0.05,
//                            bottom: MediaQuery.of(context).size.width * 0.05),
//                            width: MediaQuery.of(context).size.width,
//                            child: Column(
//                              mainAxisAlignment: MainAxisAlignment.start,
//                              crossAxisAlignment: CrossAxisAlignment.start,
//                              children: [
//
//                                Container(decoration: BoxDecoration(color: Colors.white,
//                                    borderRadius: BorderRadius.circular(8.0)),
//                                    padding:EdgeInsets.only(
//
//                                    bottom: MediaQuery.of(context).size.width * 0.025,
//                                 ),
//                                  width: MediaQuery.of(context).size.width,
//                                  height: 200.0,
//                                  child: ClipRRect(borderRadius: BorderRadius.circular(8.0),
//                                    child: FadeInImage.assetNetwork(
//                                        placeholder: 'assets/images/looding.gif',
//
//                                        fit: BoxFit.cover,
//                                        width: MediaQuery.of(context).size.width,
//                                        height: MediaQuery.of(context).size.height * 0.5
//                                        ,
//                                        image:oneProductModel.image),
//                                  )
//
//
//                                ),
//                                Divider(thickness: 1.0,color: Colors.grey.withOpacity(0.5),),
//                                SizedBox(
//                                  height: 10.0,
//                                ),
//                                Row(
//                                  mainAxisAlignment:
//                                      MainAxisAlignment.spaceBetween,
//                                  crossAxisAlignment: CrossAxisAlignment.center,
//                                  children: [
//                                    Text(
//                                      oneProductModel.name,
//                                      style: TextStyle(
//                                          fontSize:20.0,
//                                          color: Colors.black87),
//                                    ),
////                              PlusMinusDetailsUI()
//                                    //,
//
//                                  ],
//                                ),
//                                Text(
//                                  oneProductModel.desc,
//                                  style: TextStyle(color: Colors.grey,fontSize:12.0),
//                                ),
//                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                  children: [
//                                    Text(' '),
//                                    PriceOdePriceUI(fontSize:14.0,
//                                      oldPrice:oneProductModel.price,
//                                      price:oneProductModel.price ,),
//                                  ],
//                                ),
//
////                          Row(
////                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
////                            crossAxisAlignment: CrossAxisAlignment.center,
////                            children: [
////
////                              Text(
////                                '${oneProductModel.price}'+DemoLocalizations.of(context).title['currency'],
////                                style: TextStyle(color: Colors.black),
////                              ),
//////                              Row(mainAxisAlignment: MainAxisAlignment.center,
//////                                crossAxisAlignment: CrossAxisAlignment.center,
//////                                children: [
//////                                  Text('4.5',style: TextStyle(color: Colors.black,),),
//////                                  SizedBox(width: 3.0,),
//////                                  RatingBar.builder(
//////                                    initialRating: 3.0,
//////                                    minRating: 1,
//////                                    direction: Axis.horizontal,
//////                                    allowHalfRating: false,
//////                                    glow: false,
//////                                    unratedColor: Colors.grey,
//////                                    itemCount: 5,
//////                                    itemSize: 20.0,
//////                                    itemBuilder: (context, _) => Icon(
//////                                      Icons.star,
//////                                      color: Colors.amber,
//////                                    ),
//////                                    onRatingUpdate: (rating) {
//////                                      print(rating);
//////                                    },
//////                                  ),
//////
//////                                ],
//////                              ),
////                            ],
////                          ),
//                          SizedBox(
//                                  height: 10.0,
//                                ),  Text(
//                                  'برجاء الإختيار',
//                                  style: TextStyle(
//                                      fontSize: 16.0,
//                                      color: Colors.black87),
//                                ),
//
//                                 ListView.builder(primary: false
//                                      ,shrinkWrap: true,itemCount: oneProductModel.productAttributes.length
//                                      ,itemBuilder: (context,index){
//                                    return
//
//
//
//                                      ProductProperties(  productID: oneProductModel.id,
//                                          productAttribute:oneProductModel.productAttributes[index]);
//                                      }),
//
//
//                                WriteNoteDetailsUi(textEditingController: textValue,),
//                                SizedBox(
//                                  height: 20.0,
//                                ),
//
//
//                              ],
//                            ),
//                          ),
//                        )),
//                        SizedBox(height: 20.0,),
//                        ButtonUi(
//                          doubleValue:
//                          MediaQuery.of(context).size.width * 0.9,
//                          function: () async{
//                           await cartProvider.checkAddProduct(context,oneProductModel,
//                                textValue.text.toString());
//
//
//
//                          },
//                          backColor: Theme.of(context).accentColor,
//                          widget: Container(alignment: Alignment.center,
//                            padding: EdgeInsets.only(top:5.0,bottom:5.0,left: 15.0,right: 15.0),
//                            child: Row(
//                              mainAxisAlignment:
//                              MainAxisAlignment.spaceBetween,
//                              children: [
//                                Text(
//                                  '${( double.parse(oneProductModel.offerPrice==''?oneProductModel.price:oneProductModel.offerPrice)* cartProvider.quantityDetailsProduct).toStringAsFixed(2)}' +
//                                      DemoLocalizations.of(context)
//                                          .title['currency'],
//                                  style: TextStyle(
//                                    fontSize: 12.0,
//                                    color: Colors.white,
//                                    fontWeight: FontWeight.w100,
//                                  ),
//                                ),
//                                Text(
//                                  DemoLocalizations.of(context)
//                                      .title['addtoCart'],
//                                  style: TextStyle(
//                                    color: Colors.white,
//                                    fontSize: 12.0,
//                                    fontWeight: FontWeight.w100,
//                                  ),
//                                ),
//
//                              ],
//                            ),
//                          ),
//                        ),
//                        SizedBox(height: 20.0,)
//                      ],
//                    ),
//                  );
//                },
//              ),
//            );
//          }));
//}
showCardDialogFunction(
    BuildContext context ) {
   showDialog(
      context: context,
      builder: (BuildContext context) =>
          StatefulBuilder(builder: (context, setState) {
            return Scaffold(
                backgroundColor: Colors.transparent ,
                body: Consumer<CartProvider>(
                  builder: (context, cartProvider, widget) {
                    return Center(
                      child: Container(alignment: Alignment.center,
                        padding: EdgeInsets.all(MediaQuery.of(context).size.height *0.025 ),
                        margin: EdgeInsets.all(MediaQuery.of(context).size.height *0.025 ),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.3,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                              Text('نأسف لعدم تواجد بعض المنتجات , برجي المراجعةوحذف  الغير متواجد حالياً',
                              style: Theme.of(context).textTheme.headline2,
                              textAlign: TextAlign.center,),
                            ButtonUi(
                              doubleValue:
                              MediaQuery.of(context).size.width *
                                  0.75,
                              function: () {
                                Navigator.of(context).pop();
                              },
                              backColor: Theme.of(context).accentColor,
                              widget: Container(padding:EdgeInsets.only(
                                  top:5.0,bottom:5.0,left: 15.0,right: 15.0),
                                child:   Text(
                                  'مراجعة المنتجات وحذف الغير متواجد حالياً',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w100,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        )
                      ),
                    );
                  },
                ));
          }));
}

showDetailsProductFunction(
    BuildContext context, ProductsCategory oneProductModel, int newQuantity) {
  final textValue = TextEditingController();
  showDialog(
      context: context,
      builder: (BuildContext context) =>
          StatefulBuilder(builder: (context, setState) {
            return Scaffold(
                backgroundColor: Colors.transparent ,
                body: Consumer<CartProvider>(
                  builder: (context, cartProvider, widget) {
                    return SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom,
                            top: MediaQuery.of(context).size.height * 0.4),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.6,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20.0),
                                topLeft: Radius.circular(20.0))),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                          0.05,top: MediaQuery.of(context).size.width *
                                      0.05,
                                      right: MediaQuery.of(context).size.width *
                                          0.05),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(onTap: (){
                                        Navigator.of(context).pop();
                                      },
                                        child: Align(alignment: Alignment.centerRight
                                            ,child:
                                            Container(child: Icon(Icons.close,color: Colors.black87,),
                                              width:30.0,height: 30.0,decoration: BoxDecoration(
                                            color: Colors.grey.withOpacity(0.25),borderRadius: BorderRadius.circular(100.0)),)),
                                      ),

                                      Text(
                                        oneProductModel.name,
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.black87),
                                      ) ,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            '',
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                color: Colors.black87),
                                          ),

                                          PriceOdePriceUI(fontSize:16.0,
                                            oldPrice:  oneProductModel.price ,
                                            price:  oneProductModel.offerPrice,),

                                        ],
                                      ),
                                      Divider(
                                        thickness: 1.0,
                                        color: Colors.grey.withOpacity(0.5),
                                      ),
                                      SizedBox(
                                        height: 30.0,
                                      ),
                                      WriteNoteDetailsUi(textEditingController: textValue,),
                                      SizedBox(
                                        height:30.0,
                                      ),

                                     ],
                                  ),
                                ),
                              Expanded(child: SizedBox()),
                              ButtonUi(
                                doubleValue:
                                MediaQuery.of(context).size.width *
                                    0.9,
                                function: () {
                                  cartProvider.checkAddProduct(context,oneProductModel,textValue.text.toString());
                                },
                                backColor: Theme.of(context).accentColor,
                                widget: Container(padding:EdgeInsets.only(
                                    top:5.0,bottom:5.0,left: 15.0,right: 15.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${(double.parse(oneProductModel.offerPrice==''?oneProductModel.price:oneProductModel.offerPrice)
                                            * cartProvider.quantityDetailsProduct).toStringAsFixed(2)}' +
                                            DemoLocalizations.of(context)
                                                .title['currency'],
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w100,
                                        ),
                                      ),
                                      Text(
                                        DemoLocalizations.of(context)
                                            .title['addtoCart'],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w100,
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                              Expanded(child: SizedBox()),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ));
          }));
}

showSuccessFunction(BuildContext context, String imgPath, String title) {
  showDialog(
    context: context,
    builder: (BuildContext context) => Consumer<AccountProvider>(
      builder: (context, accountProvider, widget) {
        return WillPopScope(
          onWillPop: () async {
           // accountProvider.loginFunction(context);
            return true;
          },
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
//                     Align(alignment: Alignment.topRight,
//                       child: IconButton(icon: Icon(Icons.arrow_back_ios,
//                         color: Colors.black), onPressed: (){
//                        accountProvider.loginFunction(context);
//                       }),),
                  Expanded(
                      child: Center(
                          child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        imgPath,
                        color: Theme.of(context).accentColor,
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.width * 0.5,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Text(
                        DemoLocalizations.of(context)
                            .title['Theaccounthasbeenactivatedsuccessfully'],
                        style: TextStyle(color: Theme.of(context).accentColor),
                      )
                    ],
                  )))
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}

backStepsFunction(BuildContext context) {
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => HomePageUI()),
      (Route<dynamic> route) => false);
}

showLogoutDialog(BuildContext context, Function function) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return  Scaffold(backgroundColor: Colors.transparent,
          body: Center(
            child: Container(alignment: Alignment.center
              ,decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0),color: Colors.white
              ),height: 160.0,width: 250.0,
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center
                ,crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(FontAwesomeIcons.exclamationCircle,size: 40,color:Theme.of(context).accentColor),
                  SizedBox(height: 10.0,),
                   Text(
                    DemoLocalizations.of(context).title['logoutdescription'],
                    style: TextStyle(fontSize: 16.0),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10.0,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,children: [
                    RaisedButton(
                        color: Theme.of(context).accentColor,
                        child: Text(
                          DemoLocalizations.of(context).title['yes'],
                          style: TextStyle(color: Colors.white, fontSize: 12.0),
                        ),
                        onPressed: () {
                          function();
                        }),
                    RaisedButton(
                        color: Theme.of(context).accentColor,
                        child: Text(
                          DemoLocalizations.of(context).title['no'],
                          style: TextStyle(color: Colors.white, fontSize: 12.0),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        })
                  ],)


                ],
              ),
            ),
          ),)


        ;
      });
}
showDialogResult(BuildContext context,  String textData,String quntityValue) {
  showDialog(
      context: context,
      builder: (BuildContext context) => Scaffold(backgroundColor: Colors.transparent,
        body:InkWell(onTap: (){
          Navigator.of(context).pop();
        },
          child: Center(
            child: Container(alignment: Alignment.center
              ,decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0),color: Colors.white
      ),height: 160.0,width: 250.0,
            child: Stack(children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround
                ,crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height:10.0,),
                  Center(
                    child:Icon(FontAwesomeIcons.checkCircle,color: Theme.of(context).accentColor,size: 50.0,),
                  ),
                  SizedBox(height:5.0,),
            Text(
              textData,
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold),

            ),
            //quantity
            Text(
              DemoLocalizations.of(context).title['qunt']+' '+quntityValue,
              style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.bold),

            ),
                  SizedBox(height: 10.0,)
                 ],
              ),
              IconButton(icon: Icon(Icons.cancel,color: Theme.of(context).accentColor,size: 35,), onPressed: (){
                Navigator.of(context).pop();
              })

            ],),
      ),
          ),
        ),)


  );
}