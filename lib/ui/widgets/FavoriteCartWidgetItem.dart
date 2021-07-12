import 'package:elmasreenapp/core/providermodels/CartProvider.dart';
import 'package:elmasreenapp/core/providermodels/CategoryProvider.dart';
import 'package:elmasreenapp/utils/app_Localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteCartWidgetItem extends StatefulWidget {
  final Widget widgetTop;
  final Widget widget;
  final String idProduct;
  final double price;
  final double oldPrice;
  final String title;
  final String description;
  final String imgUrl;
  final int quantity;
  final String type;
  final Widget property;
  final double height;
  final int isSelected;

  const FavoriteCartWidgetItem(
      {Key key,
      @required this.widgetTop,
      @required this.widget,
      @required this.idProduct,
      @required this.price,
      @required this.oldPrice,
      @required this.title,
      @required this.description,
      @required this.imgUrl,
      @required this.quantity,
      @required this.type,
      this.property,
      this.height,
      this.isSelected})
      : super(key: key);

  @override
  _FavoriteCartWidgetItemState createState() => _FavoriteCartWidgetItemState();
}

class _FavoriteCartWidgetItemState extends State<FavoriteCartWidgetItem> {
  CategoryProvider categoryProviderItem;

  init() async {
    await Future.delayed(Duration(milliseconds: 100));
    categoryProviderItem =
        Provider.of<CategoryProvider>(context, listen: false);
    categoryProviderItem.getProductFunction(widget.idProduct);
    print(' ${widget.isSelected},,,,,,,,,casecasecase');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, cartProvider, child) {
      return Container(
        height: widget.height,
        alignment: Alignment.center,
        margin: EdgeInsets.only(bottom: 15.0),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.25),
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
                color: widget.isSelected == 1 ? Colors.white : Colors.red,
                width: 1.0)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              child: FadeInImage.assetNetwork(
                  placeholder: 'assets/images/looding.gif',
                  fit: BoxFit.fill,
                  width: 100.0,
                  height: widget.height,
                  image: widget.imgUrl),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0)),
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(

                        child: Text(
                            widget.title,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 12.0),
                          ),

                      ),
                      SizedBox(width: 8.0,),
                      widget.widgetTop
                    ],
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.description,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10.0,
                              fontWeight: FontWeight.w100),
                          overflow: TextOverflow.ellipsis,
                        ),
                         widget.property,
                        SizedBox(height: 2.0,),

                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.price.toString() == '0.0'
                            ? widget.oldPrice.toString() +
                                DemoLocalizations.of(context).title['currency']
                            : widget.price.toString() +
                                DemoLocalizations.of(context).title['currency'],
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 10.0,
                            fontWeight: FontWeight.w100),
                      ),
                      widget.widget,
                    ],
                  )
                ],
              ),
            )),
          ],
        ),
      );
    });
  }
}
