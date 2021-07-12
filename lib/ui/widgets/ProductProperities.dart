 import 'package:elmasreenapp/core/models/HomeProductsCategoryModel.dart';
import 'package:elmasreenapp/core/providermodels/CartProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Values.dart';
class ProductProperties extends StatefulWidget {
  final int productID;
  final ProductAttribute productAttribute;

  const ProductProperties({Key key, this.productID, this.productAttribute }) : super(key: key);


  @override
   ProductPropertiesState createState() => ProductPropertiesState();
}

class ProductPropertiesState extends State<ProductProperties> {
  AttributeValue selected;
  clearSelect()
  {
   selected=null;
   setState(() {

   });
  }
  @override
  Widget build(BuildContext context) {
    return  Consumer<CartProvider>(builder: (context,cartProvider,widgetUI){
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,children: [
        Text(
          widget.productAttribute.name.toString(),
          style: TextStyle(
              fontSize: 16.0, color: Colors.black87),
        ),
        SizedBox(
          height: 15.0,
        ),
        Container(padding: EdgeInsets.only(right: 20.0),decoration: BoxDecoration(color: Colors.white,
            border: Border.all(width: 1.0,color:Colors.grey.withOpacity(0.25) )
            ,borderRadius: BorderRadius.circular(8), boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.25),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],),
          child: ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: widget.productAttribute.attributeValues.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.productAttribute.attributeValues[index].value.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.0),
                          ),
                        ),
                        Radio(
                          value:widget.productAttribute.attributeValues[index],
                          groupValue:
                          selected,
                          activeColor: Theme.of(context)
                              .primaryColor,
                          onChanged: (val) {
                            setState(() {
                              selected=val;
                            });
                             cartProvider.addPropertyToCart(widget.productID,widget.productAttribute.id,
                                selected,widget.productAttribute.name.toString());
                            // cartProvider.changeOption(val);
                          },

                        ),


//                    Text(
//                      '(${cartProvider.itemsOptions[index].price}  ' +
//                          DemoLocalizations.of(
//                              context)
//                              .title['currency'],
//                      style: TextStyle(
//                          color: Theme.of(context)
//                              .primaryColor,
//                          fontSize: 12.0),
//                    ),

                      ],
                    ),
                   index==widget.productAttribute.attributeValues.length-1?SizedBox():
                   Padding(padding: EdgeInsets.only(left: 20.0),
                     child: Divider(
                        thickness: 1.0,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                   )
                  ],
                );
              }),
        ),
        SizedBox(
          height: 15.0,
        ),
      ],);
    });
  }
}
