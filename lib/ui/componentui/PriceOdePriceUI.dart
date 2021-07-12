import 'package:elmasreenapp/utils/app_Localization.dart';
import 'package:flutter/material.dart';
class PriceOdePriceUI extends StatelessWidget {
  final String price;
  final String oldPrice;
  final double fontSize;

  const PriceOdePriceUI({Key key, this.price, this.oldPrice, this.fontSize}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return   Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
      FittedBox(
        child: Text(
            price.toString()==''?oldPrice.toString()+''+DemoLocalizations
          .of(context)
          .title['currency']:price.toString()+''+DemoLocalizations
                .of(context)
                .title['currency'],
            style: TextStyle(
                color: Colors.black87, fontSize: fontSize,
                fontFamily: 'mainfont')),
      ),
           price.toString()==''?SizedBox(): FittedBox(
             child: Text(
        oldPrice.toString()+''+DemoLocalizations
                .of(context)
                .title['currency'],
          style: TextStyle(
                decoration: TextDecoration.lineThrough,
                fontSize: fontSize,
                color: Colors.red,
                fontFamily: 'mainfont')),
           )
    ],)

    ;
  }
}
