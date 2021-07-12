import 'package:elmasreenapp/core/providermodels/CartProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class PlusMinusDetailsUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context,cartProvider,widget){
      return Row(children: [
        GestureDetector(onTap: (){
          cartProvider.inQuantityDetailsProduct();

        },
          child: Container(height: 22.0,padding: EdgeInsets.only(left: 3.0,right: 3.0),
            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(3.0),
              border: Border.all(width: 1.0,color: Colors.grey),),child: Icon(Icons.add,size: 14.0,color: Colors.grey,),),
        ),
        SizedBox(width: 10.0,),
        Container(alignment: Alignment.center,height: 22.0,padding: EdgeInsets.only(bottom: 2.0,
            left:15.0,right: 15.0),
          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(3.0),
            border: Border.all(width: 1.0,color: Colors.grey),),
          child: Text(cartProvider.quantityDetailsProduct.toString()
            ,style: TextStyle(color: Colors.grey,fontSize: 14.0),),),
        SizedBox(width: 10.0,),
        GestureDetector(onTap: (){
          cartProvider.deQuantityDetailsProduct();


        },
          child: Container(height: 22.0,padding: EdgeInsets.only(left: 3.0,right: 3.0),
            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(3.0),
              border: Border.all(width: 1.0,color: Colors.grey),),child: Icon(Icons.remove,size: 14.0,
              color: Colors.grey,),),
        )
      ],);
    });
  }
}
