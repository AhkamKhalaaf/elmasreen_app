import 'package:elmasreenapp/core/models/HomeProductsCategoryModel.dart';
import 'package:elmasreenapp/core/providermodels/CartProvider.dart';
import 'package:elmasreenapp/ui/componentui/ButtonUi.dart';
import 'package:elmasreenapp/ui/componentui/PriceOdePriceUI.dart';
import 'package:elmasreenapp/ui/componentui/WriteNoteDetailsUi.dart';
import 'package:elmasreenapp/ui/widgets/ProductProperities.dart';
import 'package:elmasreenapp/utils/app_Localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowAllDetailsProductFunctionWidget extends StatefulWidget {
  final ProductsCategory oneProductModel;
  final int newQuantity;

  const ShowAllDetailsProductFunctionWidget(
      {Key key, this.oneProductModel, this.newQuantity})
      : super(key: key);

  @override
  _ShowAllDetailsProductFunctionWidgetState createState() =>
      _ShowAllDetailsProductFunctionWidgetState();
}

class _ShowAllDetailsProductFunctionWidgetState
    extends State<ShowAllDetailsProductFunctionWidget>{
  final textValue = TextEditingController();
  List<GlobalKey<ProductPropertiesState>>keys=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(int i=0;i<widget.oneProductModel.productAttributes.length;i++)
    {
      keys.add(GlobalKey<ProductPropertiesState>());
    }
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textValue.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, widgetUi) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.25),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(0, 5), // changes position of shadow
                    ),
                  ], color: Colors.white),
                  width: MediaQuery.of(context).size.width,
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                    ],
                  ),
                ),
                Expanded(
                    child: SingleChildScrollView(
                  child: Container(
                    color: Colors.white,
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.width * 0.05),
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05,
                        right: MediaQuery.of(context).size.width * 0.05,
                        bottom: MediaQuery.of(context).size.width * 0.05),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0)),
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.width * 0.025,
                            ),
                            width: MediaQuery.of(context).size.width,
                            height: 200.0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: FadeInImage.assetNetwork(
                                  placeholder: 'assets/images/looding.gif',
                                  fit: BoxFit.cover,
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.5,
                                  image: widget.oneProductModel.image),
                            )),
                        Divider(
                          thickness: 1.0,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              widget.oneProductModel.name,
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.black87),
                            ),
//                              PlusMinusDetailsUI()
                            //,
                          ],
                        ),
                        Text(
                          widget.oneProductModel.desc,
                          style: TextStyle(color: Colors.grey, fontSize: 12.0),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(' '),
                            PriceOdePriceUI(
                              fontSize: 14.0,
                              oldPrice: widget.oneProductModel.price,
                              price: widget.oneProductModel.price,
                            ),
                          ],
                        ),

//                          Row(
//                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                            crossAxisAlignment: CrossAxisAlignment.center,
//                            children: [
//
//                              Text(
//                                '${oneProductModel.price}'+DemoLocalizations.of(context).title['currency'],
//                                style: TextStyle(color: Colors.black),
//                              ),
////                              Row(mainAxisAlignment: MainAxisAlignment.center,
////                                crossAxisAlignment: CrossAxisAlignment.center,
////                                children: [
////                                  Text('4.5',style: TextStyle(color: Colors.black,),),
////                                  SizedBox(width: 3.0,),
////                                  RatingBar.builder(
////                                    initialRating: 3.0,
////                                    minRating: 1,
////                                    direction: Axis.horizontal,
////                                    allowHalfRating: false,
////                                    glow: false,
////                                    unratedColor: Colors.grey,
////                                    itemCount: 5,
////                                    itemSize: 20.0,
////                                    itemBuilder: (context, _) => Icon(
////                                      Icons.star,
////                                      color: Colors.amber,
////                                    ),
////                                    onRatingUpdate: (rating) {
////                                      print(rating);
////                                    },
////                                  ),
////
////                                ],
////                              ),
//                            ],
//                          ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'برجاء الإختيار',
                          style:
                              TextStyle(fontSize: 16.0, color: Colors.black87),
                        ),

                        ListView.builder(
                            primary: false,
                            shrinkWrap: true,
                            itemCount:
                                widget.oneProductModel.productAttributes.length,
                            itemBuilder: (context, index) {
                              return ProductProperties(key: keys[index],
                                  productID: widget.oneProductModel.id,
                                  productAttribute: widget.oneProductModel
                                      .productAttributes[index]);
                            }),
                        WriteNoteDetailsUi(
                          textEditingController: textValue,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                  ),
                )),
                SizedBox(
                  height: 20.0,
                ),
                ButtonUi(
                  doubleValue: MediaQuery.of(context).size.width * 0.9,
                  function: () async {
                    await cartProvider.checkAddProduct(context,
                        widget.oneProductModel, textValue.text.toString());
                    keys.forEach((element) {
                      element.currentState.clearSelect();
                    });
                     
                  },
                  backColor: Theme.of(context).accentColor,
                  widget: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(
                        top: 5.0, bottom: 5.0, left: 15.0, right: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${(double.parse(widget.oneProductModel.offerPrice == '' ? widget.oneProductModel.price : widget.oneProductModel.offerPrice) * cartProvider.quantityDetailsProduct).toStringAsFixed(2)}' +
                              DemoLocalizations.of(context).title['currency'],
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                        Text(
                          DemoLocalizations.of(context).title['addtoCart'],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                )
              ],
            ),
          );
        },
      ),
    ));
  }
}
