import 'package:elmasreenapp/core/dblocal/CartLDBModel.dart';
import 'package:elmasreenapp/core/models/OneProductModel.dart';
import 'package:elmasreenapp/core/providermodels/CartProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class FavoriteDetailsButtonUi extends StatelessWidget {
  final OneProductModel oneProductModel;

  const FavoriteDetailsButtonUi({Key key, this.oneProductModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Consumer<CartProvider>(builder: (context,cartProvider,widget){
      return GestureDetector(onTap: ()async{
        CartLDBModel cartLDBModel = CartLDBModel({
          'itemId': oneProductModel.productID,
          'quantity': 1,
          'price': oneProductModel.price,
          'oldprice':  oneProductModel.price,
          'total':  oneProductModel.price,
          'title':  oneProductModel.title,
          'description': oneProductModel.description,
          'img':  oneProductModel.img??'',
          'note':''

        });
        await cartProvider.triggerFavourite(context,cartLDBModel.itemId,cartLDBModel
        );


      },
        child: FutureBuilder(future: cartProvider.getFavouriteStatus(oneProductModel.productID.toString())
            ,builder: (context,snapData){
              int x=snapData.data;
//              print('${x},,snapppp');

              return
                Row(
                  children: [
                      Text(x.toString(),style: TextStyle(color: Colors.black),),
                    Container(decoration: BoxDecoration(
                        color:Colors.white ,borderRadius: BorderRadius.circular(8.0)),padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.favorite,color: x==1?
                      Theme.of(context).primaryColor:Theme.of(context).accentColor, ),),
                  ],
                )
              ;

            }),
      );
    });
  }
}
