
 import 'package:elmasreenapp/core/models/HomeProductsCategoryModel.dart';
import 'package:elmasreenapp/core/providermodels/CartProvider.dart';
import 'package:elmasreenapp/ui/componentui/AddToCartButtonUi.dart';
import 'package:elmasreenapp/ui/componentui/FavoriteButtonUi.dart';
import 'package:elmasreenapp/ui/componentui/PriceOdePriceUI.dart';
import 'package:elmasreenapp/utils/app_Localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Values.dart';
import '../DetailsOneItemProductUi.dart';
class OneItemProductUi extends StatelessWidget {
  final ProductsCategory productsCategory;

  const OneItemProductUi({Key key, this.productsCategory}) : super(key: key);
    @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context,cartProvider,child){

      return GestureDetector(onTap: (){
        Navigator.push(
            context, MaterialPageRoute(builder: (BuildContext context)
        => DetailsOneItemProductUi(oneProductModel: productsCategory,
        function: (){},)));
      },child: Container(decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.0)),
        width: MediaQuery.of(context).size.width*0.38 ,
        margin: EdgeInsets.only(left: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,children: [
          Expanded(
            child: Stack(overflow: Overflow.visible,
              children: [
                ClipRRect(borderRadius: BorderRadius.only(topLeft:Radius.circular(8.0),
                topRight:Radius.circular(8.0)),
                  child:FadeInImage.assetNetwork(
                      placeholder:'assets/images/looding.gif',
                    fit: BoxFit.cover,width: MediaQuery.of(context).size.width*0.38,


            image: productsCategory.image??''),
 ),

                 Positioned(top: 5.0,right: 5.0,
                   child:FavoriteButtonUi(backColor: Colors.white,oneProductModel: productsCategory,)
                 )
              ],
            ),
          ),
          SizedBox(height: 5.0,),
          FittedBox(child: Text(productsCategory.name.toString(),style: TextStyle(color: Colors.black,fontSize: 12.0 ),)),

          PriceOdePriceUI(fontSize:11.0,
            oldPrice:productsCategory.price.toString(),
            price: productsCategory.offerPrice.toString() ,),
          SizedBox(height: 5.0,),
          AddToCartButtonUi(note: '',quantity: 1,widget: Container(width: MediaQuery.of(context).size.width*0.38,
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
                color: Theme.of(context).primaryColor,borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8.0),
              bottomRight: Radius.circular(8.0),
            )),) ,
            oneProductModel: productsCategory,)
        ],),
      ),);
    });
  }
}
