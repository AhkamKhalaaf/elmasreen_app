import 'package:elmasreenapp/core/dblocal/AttributeDbModel.dart';
import 'package:elmasreenapp/core/dblocal/CartLDBModel.dart';
import 'package:elmasreenapp/core/providermodels/CartProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Values.dart';
class PlusMinusUi extends StatelessWidget {
  final CartLDBModel cartLDBModel;

  const PlusMinusUi({Key key, this.cartLDBModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context,cartProvider,widget){
      return Row(children: [
        GestureDetector(onTap: ()async{
           CartLDBModel oneModel = CartLDBModel({
            'itemId': cartLDBModel.itemId,
            'idProduct':cartLDBModel.idProduct,
            'quantity': cartLDBModel.quantity+1,
             'price': cartLDBModel.oldPrice.toString() != '' ? double.parse(
                 cartLDBModel.oldPrice.toString()) : 0.0,
             'oldprice': cartLDBModel.price.toString()!= '' ? double.parse(
                 cartLDBModel.oldPrice.toString()) : 0.0,
            'total':  cartLDBModel.price,
            'title':  cartLDBModel.title,
            'description': cartLDBModel.description,
            'img':  cartLDBModel.img??'',
            'note':'',
            'isSelected':1
          });


          cartProvider.updateOneItem(oneModel);
        },
          child: Container(height: 22.0,padding: EdgeInsets.only(left: 3.0,right: 3.0),
            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(3.0),
              border: Border.all(width: 1.0,color: Colors.grey),),child: Icon(Icons.add,size: 14.0,color: Colors.grey,),),
        ),
        SizedBox(width: 10.0,),
        Container(alignment: Alignment.center,height: 22.0,padding: EdgeInsets.only(bottom: 2.0,
            left:15.0,right: 15.0),
          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(3.0),
            border: Border.all(width: 1.0,color: Colors.grey),),child: Text(cartLDBModel.quantity.toString()
            ,style: TextStyle(color: Colors.grey,fontSize: 14.0),),),
        SizedBox(width: 10.0,),
        GestureDetector(onTap: (){
            if(cartLDBModel.quantity>1)
            {  CartLDBModel oneModel = CartLDBModel({
              'itemId': cartLDBModel.itemId,            'idProduct':cartLDBModel.idProduct,

              'quantity':cartLDBModel.quantity-1,
              'price': cartLDBModel.price,
              'oldprice':  cartLDBModel.price,
              'total':  cartLDBModel.price,
              'title':  cartLDBModel.title,
              'description': cartLDBModel.description,
              'img':  cartLDBModel.img??'',
              'note':'',
              'isSelected':1
            });
            cartProvider.updateOneItem(oneModel);}
          else if(cartLDBModel.quantity==1)
            {
               showBottomSheetFunction(context,(){
                cartProvider.deleteProduct(cartLDBModel.itemId.toString(),
                cartLDBModel.idProduct);
                Navigator.of(context).pop();

              });
            }
          

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
