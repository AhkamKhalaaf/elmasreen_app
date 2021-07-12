
 import 'package:elmasreenapp/core/models/HomeProductsCategoryModel.dart';
import 'package:elmasreenapp/core/providermodels/CartProvider.dart';
 import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
  class AddToCartButtonUi extends StatelessWidget {
   final ProductsCategory oneProductModel;
   final Widget widget;
   final int quantity;
   final String note;

  const AddToCartButtonUi({Key key, this.oneProductModel, this.widget, this.quantity, this.note}) : super(key: key);




   @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context,cartProvider,child){
      return GestureDetector(onTap: ()async{
        cartProvider.checkTypeProduct(context, oneProductModel,note);


     }


      ,
        child:widget ,
      );});
  }
}
