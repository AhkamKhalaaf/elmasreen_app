import 'package:elmasreenapp/core/providermodels/CartProvider.dart';
import 'package:elmasreenapp/ui/ButtonCartUi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GotoCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Consumer<CartProvider>(builder: (context, cartProvider, child){
      return       GestureDetector(
          child: Stack(overflow: Overflow.visible,alignment: Alignment.center,
            children: [
              Positioned (bottom: 20.0,left: 10.0,
                child: Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Theme.of(context).accentColor),
                  child: Text( cartProvider.quantity
                      .toString()=='null'?'0':cartProvider.quantity
                      .toString(),style: TextStyle(fontSize: 12.0,color: Colors.white),),
                ),
              ),
              ImageIcon(
                AssetImage('assets/icons/shoppingcart.png'),
                size: 20.0,
                color: Colors.black.withOpacity(0.9),
              ),

            ],
          ),
          onTap: () async {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ButtonCartUi()),
            );
          });
    },);
  }
}
