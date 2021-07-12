import 'package:elmasreenapp/core/dblocal/CartLDBModel.dart';
import 'package:elmasreenapp/core/models/HomeProductsCategoryModel.dart';
 import 'package:elmasreenapp/core/providermodels/CartProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class FavoriteButtonUi extends StatefulWidget {
  final ProductsCategory oneProductModel;
  final Color backColor;

  const FavoriteButtonUi({Key key, this.oneProductModel, this.backColor}) : super(key: key);

  @override
  _FavoriteButtonUiState createState() => _FavoriteButtonUiState();
}

class _FavoriteButtonUiState extends State<FavoriteButtonUi> {
   @override
  Widget build(BuildContext context) {
    return  Consumer<CartProvider>(builder: (context,cartProvider,widgetUi){
      return GestureDetector(onTap: ()async{
        CartLDBModel cartLDBModel = CartLDBModel({
          'itemId': widget.oneProductModel.id.toString(),
          'idProduct': widget.oneProductModel.id.toString(),

          'quantity': 1,

          'price': widget.oneProductModel.offerPrice.toString()!=''?
          double.parse(widget.oneProductModel.offerPrice.toString()):0.0,
          'oldprice':  widget.oneProductModel.price.toString()!=''?
          double.parse(widget.oneProductModel.price.toString()):0.0,
          'total':  widget.oneProductModel.offerPrice.toString()!=''?
          double.parse(widget.oneProductModel.offerPrice.toString()):0.0,
          'title':  widget.oneProductModel.name,
          'description': widget.oneProductModel.desc,
          'img':  widget.oneProductModel.image??'',
          'note':'',
          'isSelected':1

        });
        await cartProvider.triggerFavourite(context,cartLDBModel.itemId.toString(),cartLDBModel
        );
        if (mounted) setState(() {});
      //  print('${y},,gestecttor');

      },
        child: FutureBuilder(future: cartProvider.getFavouriteStatus(widget.oneProductModel.id.toString())
            ,builder: (context,snapData){
              int x=snapData.data;


              return  Container(decoration: BoxDecoration(
                  color:widget.backColor ,borderRadius: BorderRadius.circular(8.0))
                ,padding: EdgeInsets.all(3.0),
                child: Icon(Icons.favorite,color: x==1?
                Theme.of(context).primaryColor:Theme.of(context).accentColor, ),);


            }),
      );
    });
  }
}
