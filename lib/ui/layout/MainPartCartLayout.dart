import 'package:dotted_border/dotted_border.dart';
import 'package:elmasreenapp/core/dblocal/AttributeDbModelFake.dart';
import 'package:elmasreenapp/core/dblocal/CartLDBModel.dart';
import 'package:elmasreenapp/core/providermodels/CartProvider.dart';
import 'package:elmasreenapp/ui/componentui/ButtonUi.dart';
import 'package:elmasreenapp/ui/componentui/PlusMinusUi.dart';
import 'package:elmasreenapp/ui/layout/TextCartUi.dart';
import 'package:elmasreenapp/ui/widgets/FavoriteCartWidgetItem.dart';
import 'package:elmasreenapp/utils/app_Localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';


import '../../Values.dart';
import '../HomePageUI.dart';
import '../LoadingUi.dart';
import 'NoDataFoundLayout.dart';

class MainPartCartLayout extends StatefulWidget {
  @override
  _MainPartCartLayoutState createState() => _MainPartCartLayoutState();
}

class _MainPartCartLayoutState extends State<MainPartCartLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
      child: cartUi(context),
    );
  }

  Widget cartUi(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, cartProvider, child) {
      return FutureBuilder(
          future: cartProvider.getAllProducts(),
          builder: (context, snapData) {
            List<CartLDBModel> items = snapData.data;
            // print('${items[0].itemId.toString()},,,,,snapDatmmmmmmmmmmma');
            if (snapData.data != null) {
              return items.length > 0
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: ListView.builder(
                                itemCount: items.length,
                                shrinkWrap: true,
                                primary: false,
                                itemBuilder: (context, index) {
                                  return FavoriteCartWidgetItem(
                                    height: 100.0,
                                    property: FutureBuilder(
                                      future: cartProvider
                                          .getAllPropertiesProductFake(
                                              items[index].itemId.toString()),
                                      builder: (context, snapData) {
                                        print(
                                            '${items[index].itemId.toString()},,,,,,itemID');
                                        if (snapData.hasData) {
                                          List<AttributeDbModelFake>
                                              productItem = snapData.data;
                                          print(
                                              '${productItem.length},,,,,,length');
                                          if (productItem.length > 0) {
                                            return Wrap(
                                                children: productItem
                                                    .map((e) => Container(
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0),
                                                              border: Border.all(
                                                                  color: Theme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  width: 1.0)),
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 4.0,
                                                                  right: 4.0),
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 4.0),
                                                          child: Text(
                                                            e.title.toString() +
                                                                ' : ' +
                                                                e.value
                                                                    .toString(),
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.grey,
                                                                fontSize: 8.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w100),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                        ))
                                                    .toList());
                                          } else {
                                            return SizedBox();
                                          }
                                        }
                                        return SizedBox();
                                      },
                                    ),
                                    oldPrice: items[index].oldPrice,
                                    widgetTop: GestureDetector(
                                      child: ImageIcon(
                                        AssetImage(
                                            'assets/icons/deleteicon.png'),
                                        color: Colors.red,
                                      ),
                                      onTap: () {
                                        showBottomSheetFunction(context, () {
                                          cartProvider.deleteProduct(
                                              items[index].itemId,
                                              items[index].idProduct);

                                          Navigator.of(context).pop();
                                        });
                                      },
                                    ),
                                    widget: PlusMinusUi(
                                      cartLDBModel: items[index],
                                    ),
                                    title: items[index].title,
                                    price: items[index].price,
                                    description: items[index].description,
                                    idProduct: items[index].idProduct,
                                    imgUrl: items[index].img,
                                    quantity: items[index].quantity,
                                    type: 'cart',
                                    isSelected: items[index].isSelected,
                                  );
                                })),
                        SizedBox(
                          height: 10.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(bottom: 5.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                      width: 1.0, color: Color(0xffE9E9E9))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Color(0xfff7f7f7),
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(8.0),
                                            topLeft: Radius.circular(8.0))),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 5.0,
                                        ),
                                        Text(
                                          DemoLocalizations.of(context)
                                              .title['paymentDetails'],
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black),
                                          textAlign: TextAlign.center,
                                        ),
                                        Container(
                                          height: 5.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 1.0,
                                    color: Color(0xffE9E9E9),
                                    width:
                                        MediaQuery.of(context).size.width - 0.1,
                                  ),
                                  Container(
                                    height: 5.0,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              TextCartUi(
                                                title: DemoLocalizations.of(
                                                        context)
                                                    .title['Totalrequests'],
                                              ),
                                              SizedBox(
                                                height: 3.0,
                                              ),
                                              Container(
                                                height: 1.0,
                                                color: Color(0xffE9E9E9),
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.25,
                                              ),
                                              SizedBox(
                                                height: 3.0,
                                              ),
                                              TextCartUi(
                                                title: cartProvider.total
                                                        .toStringAsFixed(2)
                                                        .toString() +
                                                    DemoLocalizations.of(
                                                            context)
                                                        .title['currency'],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              TextCartUi(
                                                title: DemoLocalizations.of(
                                                        context)
                                                    .title['Totalquantity'],
                                              ),
                                              SizedBox(
                                                height: 3.0,
                                              ),
                                              Container(
                                                height: 1.0,
                                                color: Color(0xffE9E9E9),
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.25,
                                              ),
                                              SizedBox(
                                                height: 3.0,
                                              ),
                                              TextCartUi(
                                                title: cartProvider.quantity
                                                    .toString(),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              TextCartUi(
                                                title: DemoLocalizations.of(
                                                            context)
                                                        .title['Tax'] +
                                                    ' ${cartProvider.mapAboutApp.tax} %',
                                              ),
                                              SizedBox(
                                                height: 3.0,
                                              ),
                                              Container(
                                                height: 1.0,
                                                color: Color(0xffE9E9E9),
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.25,
                                              ),
                                              SizedBox(
                                                height: 3.0,
                                              ),
                                              TextCartUi(
                                                title: cartProvider.taxi
                                                        .toStringAsFixed(2)
                                                        .toString() +
                                                    DemoLocalizations.of(
                                                            context)
                                                        .title['currency'],
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            ButtonUi(
                              backColor: Theme.of(context).accentColor,
                              function: () async {
                                if (items.length > 0) {
                                  cartProvider
                                      .checkFirstlyCartProducts(context);
                                } else {
                                  Toast.show('السلة فارغة', context,
                                      duration: Toast.LENGTH_LONG,
                                      gravity: Toast.BOTTOM);
                                }
                              },
                              widget: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      //Total
                                      Text(
                                        DemoLocalizations.of(context)
                                            .title['Total'],
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w100,
                                            color: Colors.white),
                                      ),
                                      SizedBox(
                                        width: 3.0,
                                      ),
                                      Text(
                                        (cartProvider.total + cartProvider.taxi)
                                                .toStringAsFixed(2)
                                                .toString() +
                                            DemoLocalizations.of(context)
                                                .title['currency'],
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w100,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    DemoLocalizations.of(context)
                                        .title['Continuetopurchase'],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w100),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  : noData(context);
            }
            return LoadingUi();
          });
    });
  }

  Widget noData(BuildContext context) {
    return NoDataFoundLayout(
      spaceOrNot: true,
      widget: GestureDetector(
        onTap: () {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => HomePageUI()),
              (Route<dynamic> route) => false);
        },
        child: DottedBorder(
          color: Colors.black,
          strokeWidth: 1,
          child: Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0)),
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.6,
            child: Text(DemoLocalizations.of(context).title['shopnow']),
          ),
        ),
      ),
      imagePath: 'assets/images/nodatacart.png',
      title: DemoLocalizations.of(context).title['nocartdata'],
    );
  }
}
