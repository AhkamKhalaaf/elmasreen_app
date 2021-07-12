import 'package:elmasreenapp/core/dblocal/CartLDBModel.dart';
import 'package:elmasreenapp/core/models/HomeProductsCategoryModel.dart';
import 'package:elmasreenapp/core/providermodels/CartProvider.dart';
import 'package:elmasreenapp/ui/widgets/ShowAllDetailsProductFunctionWidget.dart';
import 'package:elmasreenapp/utils/app_Localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';

import '../Values.dart';

import 'componentui/PriceOdePriceUI.dart';

class DetailsOneItemProductUi extends StatefulWidget {
  final ProductsCategory oneProductModel;
  final Function function;

  const DetailsOneItemProductUi({Key key, this.oneProductModel, this.function})
      : super(key: key);

  @override
  _DetailsOneItemProductUiState createState() =>
      _DetailsOneItemProductUiState();
}

class _DetailsOneItemProductUiState extends State<DetailsOneItemProductUi> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Consumer<CartProvider>(builder: (context, cartProvider, widgetUi) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.5,
                child: Stack(
                  overflow: Overflow.visible,
                  children: [
                    widget.oneProductModel.productImages.length > 0
                        ? Swiper(
                            autoplay: true,
                            loop: false,
                            autoplayDisableOnInteraction: true,
                            index: currentIndex,
                            controller: SwiperController(),
                            onIndexChanged: (index) {
                              setState(() {
                                currentIndex = index;
                              });
                            },
                            pagination: SwiperPagination(
                                builder: DotSwiperPaginationBuilder(
                                    activeColor: Theme.of(context).primaryColor,
                                    color: Theme.of(context).accentColor)),
                            itemCount:
                                widget.oneProductModel.productImages.length,
                            autoplayDelay: 4000,
                            itemBuilder: (context, index) {
                              //
                              return ClipRRect(
                                child: FadeInImage.assetNetwork(
                                    placeholder: 'assets/images/looding.gif',
                                    fit: BoxFit.fill,
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.5,
                                    image: widget.oneProductModel
                                        .productImages[index].image),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(60.0)),
                              );
                            },
                          )
                        : ClipRRect(
                            child: FadeInImage.assetNetwork(
                                placeholder: 'assets/images/looding.gif',
                                fit: BoxFit.fill,
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.5,
                                image: widget.oneProductModel.image),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(60.0)),
                          ),
                    Positioned(
                    top: 15.0,right: 15.0,

                      child:
                      GestureDetector(onTap: (){
                        Navigator.of(context).pop();
                      },
                        child: Container(width:45.0,height: 45.0,
                          padding: EdgeInsets.only(left:6.0),alignment: Alignment.centerLeft,decoration: BoxDecoration(
                            color:Colors.white
                            ,borderRadius: BorderRadius.circular(8.0)),

                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      )
                      ,
                    ),
                    Positioned(
                        right: 50.0,
                        bottom: -18.0,
                        child:
                            //FavoriteDetailsButtonUi(oneProductModel:oneProductModel)
                            GestureDetector(
                          onTap: () async {
                            CartLDBModel cartLDBModel = CartLDBModel({
                              'itemId': widget.oneProductModel.id.toString(),
                              'quantity': 1,
                              'price': widget.oneProductModel.offerPrice == ''
                                  ? 0.0
                                  : double.parse(
                                      widget.oneProductModel.offerPrice),
                              'oldprice':
                                  double.parse(widget.oneProductModel.price),
                              'total': widget.oneProductModel.offerPrice == ''
                                  ? 0.0
                                  : double.parse(
                                      widget.oneProductModel.offerPrice),
                              'title': widget.oneProductModel.name,
                              'description': widget.oneProductModel.desc,
                              'img': widget.oneProductModel.image ?? '',
                              'isSelected':1

                            });
                            await cartProvider.triggerFavourite(
                                context,
                                widget.oneProductModel.id.toString(),
                                cartLDBModel);
                            if (mounted) setState(() {});
                            widget.function();
                          },
                          child: FutureBuilder<int>(
                            future: cartProvider.getFavouriteStatus(
                                widget.oneProductModel.id.toString()),
                            builder: (context, snapData) {
                              int x = snapData.data;
                              return Container(
                                padding: EdgeInsets.all(6.0),
                                child: Icon(
                                  Icons.favorite,
                                  size: 30.0,
                                  color: x == 1
                                      ? Theme.of(context).primaryColor
                                      : Theme.of(context).accentColor,
                                ),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 4,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                    color: Colors.white,
                                    border: Border.all(
                                        width: 1.0,
                                        color: Colors.grey.withOpacity(0.5)),
                                    borderRadius: BorderRadius.circular(50.0)),
                              );
                            },
                          ),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Expanded(
                child: Container(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: FittedBox(
                              child: Text(
                                widget.oneProductModel.name,
                                style: TextStyle(
                                    color: Colors.black87),
                              ),
                            ),
                          ),
                          SizedBox(width: 10.0,),

                          PriceOdePriceUI(
                            fontSize: 16.0,
                            oldPrice: widget.oneProductModel.price.toString(),
                            price: widget.oneProductModel.offerPrice.toString(),
                          )
                          // PlusMinusDetailsUI()
                        ],
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Divider(
                        thickness: 1.0,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),

//                      Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        crossAxisAlignment: CrossAxisAlignment.center,
//                        children: [
//
//
////                          Row(mainAxisAlignment: MainAxisAlignment.center,
////                            crossAxisAlignment: CrossAxisAlignment.center,
////                            children: [
////                              Text('4.5',style: TextStyle(color: Colors.black,),),
////                              SizedBox(width: 3.0,),
////                              RatingBar.builder(
////                                initialRating: 3.0,
////                                minRating: 1,
////                                direction: Axis.horizontal,
////                                allowHalfRating: false,
////                                glow: false,
////                                unratedColor: Colors.grey,
////                                itemCount: 5,
////                                itemSize: 20.0,
////                                itemBuilder: (context, _) => Icon(
////                                  Icons.star,
////                                  color: Colors.amber,
////                                ),
////                                onRatingUpdate: (rating) {
////                                  print(rating);
////                                },
////                              ),
////
////                            ],
////                          ),
//                        ],
//                      ),
                      Text(
                        DemoLocalizations.of(context).title['description'],
                        style: TextStyle(color: Theme.of(context).primaryColor,fontSize:20.0),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Expanded(
                          child: Text(
                        widget.oneProductModel.desc,
                        style: TextStyle(color: Colors.grey,fontSize:12.0),
                      ))
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print(
                      '${widget.oneProductModel.hasAttributes == 1},,,prodict state');
                  if (widget.oneProductModel.hasAttributes == 1) {

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                ShowAllDetailsProductFunctionWidget( oneProductModel: widget.oneProductModel,
                               newQuantity:  cartProvider.quantityDetailsProduct, )));
                  } else {
                    showDetailsProductFunction(context, widget.oneProductModel,
                        cartProvider.quantityDetailsProduct);
                  }
                },
                //AddToCartButtonUi
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          DemoLocalizations.of(context).title['addtoCart'],
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Icon(
                          Icons.add,
                          color: Colors.white,
                        )
                      ],
                    ),
                    height: 60.0,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(25.0))),
                    width: MediaQuery.of(context).size.width * 0.5,
                  ),
                ),
              )
            ],
          ),
        );
      }),
    ));
  }
}
