 import 'package:elmasreenapp/core/models/HomeProductsCategoryModel.dart';
import 'package:elmasreenapp/ui/componentui/AddToCartButtonUi.dart';
import 'package:elmasreenapp/ui/componentui/PriceOdePriceUI.dart';
import 'package:elmasreenapp/utils/app_Localization.dart';
import 'package:flutter/material.dart';

import '../../Values.dart';
import '../DetailsOneItemProductUi.dart';
class OneOfferWidgetItem extends StatelessWidget {
 final ProductsCategory productsCategory;

  const OneOfferWidgetItem({Key key, this.productsCategory}) : super(key: key);
   @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: (){
      Navigator.push(
          context, MaterialPageRoute(builder: (BuildContext context)
      => DetailsOneItemProductUi(oneProductModel: productsCategory,
        function: (){},)));
    },
      child: Container(decoration: BoxDecoration (color: weightColorGrey,borderRadius: BorderRadius.circular(8.0)),

        child: Column( mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(color: weightColorGrey,width: MediaQuery.of(context).size.width,
                  child: Stack(overflow: Overflow.visible,
                    children: [
                      Container(width: MediaQuery.of(context).size.width,decoration: BoxDecoration(
                          color:weightColorGrey,borderRadius: BorderRadius.only(topLeft:Radius.circular(8.0),
                        topRight: Radius.circular(8.0),)),
                        child: ClipRRect(borderRadius: BorderRadius.only(topLeft:Radius.circular(8.0),
                          topRight: Radius.circular(8.0),)
                          ,child:FadeInImage.assetNetwork(
                              placeholder:'assets/images/looding.gif',
                              fit: BoxFit.cover,width: MediaQuery.of(context).size.width *0.5 -12,
                              image: productsCategory.image),),
                      ),
                      Positioned(left: 0.0,
                        child: Container(width: 30.0,height:35.0,
                          alignment: Alignment.center,padding: EdgeInsets.only(top:3.0
                            ,bottom: 3.0,left: 3.0,right: 8.0),
                          decoration: BoxDecoration(borderRadius:
                          BorderRadius.only(topLeft:Radius.circular(8.0),
                              bottomRight: Radius.circular(50.0)),
                              color: Theme.of(context).primaryColor),
                          child: FittedBox(
                            child: Text(
                              //'9090'
                             '${productsCategory.precentageOffer.toString()??''}%',
                              style: TextStyle(color: Colors.white, ),),
                          ),),
                      )


                    ],
                  ),
                ),
              ),
              SizedBox(height:2.0,),

              FittedBox(child: Text(productsCategory.name.toString(),style: TextStyle(color: Colors.black,fontSize: 12.0 ),)),

              PriceOdePriceUI(fontSize:11.0,
                oldPrice:productsCategory.price.toString(),
                price: productsCategory.offerPrice.toString() ,),
              SizedBox(height: 2.0,),
              AddToCartButtonUi(note: '',quantity: 1,widget: Container(width: MediaQuery.of(context).size.width *0.5 -12,
                padding: EdgeInsets.only(left:5.0,right: 5.0,top: 8.0,bottom: 8.0),alignment: Alignment.center
                ,child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.add,color: Colors.white,size: 12.0,),
                    SizedBox(width:3.0,),
                    Text(DemoLocalizations.of(context).title['addtoCart'],
                      style: TextStyle(color: Colors.white,
                          fontWeight: FontWeight.normal,fontSize: 10.0),),

                  ],
                ),decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.only(bottomLeft:Radius.circular(8.0),
                    bottomRight:Radius.circular(8.0) )),) ,
                oneProductModel: productsCategory,),
//            Container(  padding: EdgeInsets.only(left:5.0,right: 5.0,top: 8.0,bottom: 8.0),alignment: Alignment.center,
//              child: Text('العرض لمدة 30 ساعة',style: TextStyle(color: Colors.white,
//                  fontSize: 10.0),) ,
//              decoration: BoxDecoration(
//                  color: Theme.of(context).primaryColor,borderRadius: BorderRadius.only(
//                  bottomRight:Radius.circular(8.0),
//                  bottomLeft: Radius.circular(8.0)
//              )),)
            ],)),
    );
  }
}
