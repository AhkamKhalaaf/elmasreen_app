import 'package:dotted_line/dotted_line.dart';
import 'package:elmasreenapp/core/dblocal/CartLDBModel.dart';
import 'package:elmasreenapp/core/providermodels/AccountProvider.dart';
import 'package:elmasreenapp/core/providermodels/AddressProvider.dart';
import 'package:elmasreenapp/core/providermodels/CartProvider.dart';
import 'package:elmasreenapp/ui/componentui/ButtonUi.dart';
import 'package:elmasreenapp/ui/layout/TextCartUi.dart';
import 'package:elmasreenapp/utils/app_Localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../Values.dart';
import '../LoadingUi.dart';
import 'CustomAppBarFollowUi.dart';

class ConfirmPageUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: WillPopScope(
      onWillPop: () async {
        backStepsFunction(context);

        return true;
      },
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Consumer<CartProvider>(
              builder: (context, cartProvider, widgetUi) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppBarFollowUi(
                    title: DemoLocalizations.of(context)
                        .title['followupwiththeorder'],
                  ),
                  Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.05),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.white,
                                    size: 25.0,
                                  ),
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      shape: BoxShape.circle),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text('المستخدم',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2
                                        .copyWith(
                                            fontSize: 11.0,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black),
                                    textAlign: TextAlign.center),
                              ],
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  DottedLine(
                                    dashColor: Colors.black87,
                                    lineThickness: 2.0,
                                    dashGapLength: 1.50,
                                    dashRadius: 1.0,
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  )
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Icon(
                                    FontAwesomeIcons.mapMarkerAlt,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      shape: BoxShape.circle),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text('العنوان',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2
                                        .copyWith(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w600),
                                    textAlign: TextAlign.center),
                              ],
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  DottedLine(
                                    dashColor: Colors.black87,
                                    lineThickness: 2.0,
                                    dashGapLength: 1.50,
                                    dashRadius: 1.0,
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  )
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Icon(
                                    Icons.local_shipping_rounded,
                                    color: Colors.white,
                                    size: 20.0,
                                  ),
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      shape: BoxShape.circle),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text('الشحن',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2
                                        .copyWith(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w600),
                                    textAlign: TextAlign.right),
                              ],
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  DottedLine(
                                    dashColor: Colors.black87,
                                    lineThickness: 2.0,
                                    dashGapLength: 1.50,
                                    dashRadius: 1.0,
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  )
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Icon(
                                    Icons.payment,
                                    color: Colors.white,
                                    size: 20.0,
                                  ),
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      shape: BoxShape.circle),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text('الدفع',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2
                                        .copyWith(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w600),
                                    textAlign: TextAlign.center),
                              ],
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  DottedLine(
                                    dashColor: Colors.black87,
                                    lineThickness: 2.0,
                                    dashGapLength: 1.50,
                                    dashRadius: 1.0,
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  )
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 25.0,
                                  ),
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      shape: BoxShape.circle),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text('التأكيد',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2
                                        .copyWith(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w600),
                                    textAlign: TextAlign.center),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Divider(
                          thickness: 1.0,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.05,
                            left: MediaQuery.of(context).size.width * 0.05,
                            bottom: MediaQuery.of(context).size.width * 0.05),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Consumer<AccountProvider>(
                                builder: (context, accountProvider, widgetUi) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
//                                  Text(
//                                    'البيانات الشخصية',
//                                    textAlign: TextAlign.start,
//                                    style: TextStyle(
//                                        color: Colors.black.withOpacity(0.9),
//                                        fontSize: 16.0),
//                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          'اسم العميل',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color:
                                                  Colors.black.withOpacity(0.9),
                                              fontSize: 12.0),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Text(
                                          accountProvider.nameUser,
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: Colors.black
                                                  .withOpacity(0.75),
                                              fontSize: 12.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    thickness: 1.0,
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          'رقم الهاتف',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color:
                                                  Colors.black.withOpacity(0.9),
                                              fontSize: 12.0),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Text(
                                          accountProvider.phoneUser,
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: Colors.black
                                                  .withOpacity(0.75),
                                              fontSize: 12.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    thickness: 1.0,
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          'البريد الإلكتروني',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color:
                                                  Colors.black.withOpacity(0.9),
                                              fontSize: 12.0),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Text(
                                          accountProvider.emailUser,
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: Colors.black
                                                  .withOpacity(0.75),
                                              fontSize: 12.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                ],
                              );
                            }),
                            Divider(
                              thickness: 1.0,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                            Consumer<AddressProvider>(
                              builder: (context, addressProvider, widgetUi) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        'تفاصيل العنوان ',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.9),
                                            fontSize: 12.0),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        addressProvider.addressesUserSelected
                                                .addressTitle +
                                            ' ' +
                                            addressProvider
                                                .addressesUserSelected.address +
                                            ' ' +
                                            addressProvider
                                                .addressesUserSelected.region +
                                            ' ' +
                                            addressProvider
                                                .addressesUserSelected.area,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.75),
                                            fontSize: 12.0),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Consumer<CartProvider>(
                                builder: (context, cartProvider, child) {
                              return FutureBuilder(
                                  future: cartProvider.getAllProducts(),
                                  builder: (context, snapData) {
                                    List<CartLDBModel> items = snapData.data;
                                    //  print('${snapData.data},,,,,snapData');
                                    if (snapData.data != null) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Divider(
                                            thickness: 1.0,
                                            color: Colors.grey.withOpacity(0.5),
                                          ),
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 2,
                                                child: Text(
                                                  'طريقة الشحن',
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      color: Colors.black
                                                          .withOpacity(0.9),
                                                      fontSize: 12.0),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 3,
                                                child: Text(
                                                  cartProvider
                                                      .shippingMethodName
                                                      .toString(),
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      color: Colors.black
                                                          .withOpacity(0.75),
                                                      fontSize: 12.0),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Divider(
                                            thickness: 1.0,
                                            color: Colors.grey.withOpacity(0.5),
                                          ),
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 2,
                                                child: Text(
                                                  'طريقة الدفع',
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      color: Colors.black
                                                          .withOpacity(0.9),
                                                      fontSize: 12.0),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 3,
                                                child: Text(
                                                  cartProvider.paymentMethodName
                                                      .toString(),
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      color: Colors.black
                                                          .withOpacity(0.75),
                                                      fontSize: 12.0),
                                                ),
                                              ),
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
                                            height: 10.0,
                                          ),
                                          Text(
                                            'المنتجات',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(0.9),
                                                fontSize: 16.0),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          ListView.builder(
                                              itemCount: items.length,
                                              shrinkWrap: true,
                                              primary: false,
                                              itemBuilder: (context, index) {
                                                return Container(height: 70.0,
                                                  margin: EdgeInsets.only(
                                                      bottom: 15.0),
                                                  decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey
                                                              .withOpacity(
                                                                  0.25),
                                                          spreadRadius: 1,
                                                          blurRadius: 3,
                                                          offset: Offset(0,
                                                              3), // changes position of shadow
                                                        ),
                                                      ],
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0)),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      ClipRRect(
                                                        child: FadeInImage
                                                            .assetNetwork(
                                                                placeholder:
                                                                    'assets/images/looding.gif',
                                                                fit:
                                                                    BoxFit.fill,
                                                                width: 60.0,
                                                                height: 70.0,
                                                                image:
                                                                    items[index]
                                                                        .img),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topRight: Radius
                                                                    .circular(
                                                                        8.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        8.0)),
                                                      ),
                                                      Expanded(
                                                          child: Container(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Expanded(
                                                                  child: Text(
                                                                    items[index]
                                                                        .title,
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w300,
                                                                        fontSize:
                                                                            10.0),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    items[index]
                                                                                .price
                                                                                .toString() ==
                                                                            '0.0'
                                                                        ? items[index]
                                                                                .oldPrice
                                                                                .toString() +
                                                                            DemoLocalizations.of(context).title[
                                                                                'currency']
                                                                        : items[index]
                                                                                .price
                                                                                .toString() +
                                                                            DemoLocalizations.of(context)
                                                                                .title['currency'],
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            10.0,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w100),
                                                                  ),
                                                                  Text(
                                                                    items[index]
                                                                        .quantity
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            10.0,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w100),
                                                                  ),
                                                                ],
                                                              ),

                                                          ],
                                                        ),
                                                      )),
                                                    ],
                                                  ),
                                                );
                                              }),

                                        ],
                                      );
                                    }
                                    return LoadingUi();
                                  });
                            }),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05,
                        right: MediaQuery.of(context).size.width * 0.05,
                        top: 10.0,
                        bottom: 10.0),
                    child: Column(
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
                                width: MediaQuery.of(context).size.width - 0.1,
                              ),
                              Container(
                                height: 5.0,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                            title: DemoLocalizations.of(context)
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
                                                DemoLocalizations.of(context)
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
                                            title: DemoLocalizations.of(context)
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
                                            title: DemoLocalizations.of(context)
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
                                                DemoLocalizations.of(context)
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
                          height: 20.0,
                        ),
                        ButtonUi(
                          backColor: Theme.of(context).accentColor,
                          function: () async {
                            cartProvider.checkFirstlyConfirmCartProducts(context);
                          },
                          widget: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  )
                ],
              ),
            );
          }),
        ),
      ),
    ));
  }
}
