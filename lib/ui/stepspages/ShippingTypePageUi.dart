import 'package:dotted_line/dotted_line.dart';
import 'package:elmasreenapp/core/models/shippingMethodsModel.dart';
import 'package:elmasreenapp/core/providermodels/CartProvider.dart';
import 'package:elmasreenapp/ui/LoadingUi.dart';
import 'package:elmasreenapp/ui/componentui/ButtonUi.dart';
import 'package:elmasreenapp/ui/layout/NoProductFoundUI.dart';
import 'package:elmasreenapp/utils/app_Localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

import '../../Values.dart';
import 'CustomAppBarFollowUi.dart';
import 'PaymentTypePageUi.dart';
class ShippingTypePageUi extends StatefulWidget {
  @override
  _ShippingTypePageUiState createState() => _ShippingTypePageUiState();
}

class _ShippingTypePageUiState extends State<ShippingTypePageUi> {
  CartProvider _cartProvider;
  initCall()async
  {
    _cartProvider=Provider.of<CartProvider>(context,listen: false);
    _cartProvider.getShippingMethods();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initCall();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: WillPopScope(onWillPop: ()async{
      backStepsFunction(context);

      return true;
    },
      child: Scaffold(body: Container(width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,children: [
          CustomAppBarFollowUi(title: DemoLocalizations.of(context).title['followupwiththeorder'],),

Expanded(
  child:   Container(width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,

    padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.05),

  child: Column(mainAxisAlignment: MainAxisAlignment.start,

        crossAxisAlignment: CrossAxisAlignment.start,children: [
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
                  color:Theme.of(context).primaryColor,shape:BoxShape.circle),),    SizedBox(height: 5.0,),
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


      SizedBox(height:10.0),



      //Divider(thickness: 1.0,color:Colors.grey.withOpacity(0.5)),
  Expanded(
    child: Column(   mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(DemoLocalizations.of(context).title['Chooseadeliverysystem'],

            style: Theme.of(context).textTheme.headline2.copyWith(fontSize: 16.0),),
        SizedBox(height: 10.0),
        Consumer<CartProvider>(builder: (context,cartProvider,widgetUi){

                  return FutureBuilder(future:cartProvider.getShippingMethods() ,builder: (context,snapShot){

                   // print('${snapShot.data},,,sasas');

                    if(snapShot.hasData)

                      {

                        List<ShippingMethod>items=snapShot.data;

                        if(items.length>0)

                          {
                            return Container(alignment: Alignment.center,padding: EdgeInsets.only(right: 20.0),decoration: BoxDecoration(color: Colors.white,
                              border: Border.all(width: 1.0,color:Colors.grey.withOpacity(0.25) )
                              ,borderRadius: BorderRadius.circular(8), boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.25),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],),
                              child: ListView.builder(shrinkWrap: true,primary: false,itemCount: items.length,itemBuilder: (context,index){

                               return Row(crossAxisAlignment: CrossAxisAlignment.center,
                                   mainAxisAlignment: MainAxisAlignment.center,children: [

                                 Expanded(child: Text(items[index].name,style:
                                 Theme.of(context).textTheme.headline2.copyWith(
                                     fontSize: 14.0
                                 ))),
                                 Radio<String>(value: items[index].id.toString(),
                                     groupValue: cartProvider.shippingMethodSelected,
                                     onChanged: (  c){
                                       cartProvider.changeShippingMethod(c,items[index]);
                                     }),
                               ],);
                           }),
                            );

                          }

                        else

                          {

                            return NoProductFoundUI();

                          }

                      }

                    return LoadingUi();

                  });

                }),
      ],
    ),
  ),



    Consumer<CartProvider>(builder: (context,cartProvider,widgetUI){
      return ButtonUi(widget: Text(DemoLocalizations.of(context).title['next'],style: TextStyle(color: Colors.white),),

        backColor: Theme.of(context).accentColor,

        function: (){
        if(cartProvider.shippingMethodSelected!='')
          {
            Navigator.pushReplacement(

              context,

              PageRouteBuilder(

                pageBuilder: (context, animation1, animation2) => PaymentTypePageUi(),

                transitionDuration: Duration(seconds: 0),

              ),

            );
          }

           else
                        {
                          Toast.show(
                              'أختر طريقة الشحن أولاً',
                              context,
                              duration: Toast.LENGTH_LONG,
                              gravity: Toast.BOTTOM);
                        }


        },

        doubleValue: MediaQuery.of(context).size.width*0.9,);
    }),

  ],),),
)
        ],),),),
    ));
  }
}
