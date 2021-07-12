import 'package:elmasreenapp/core/providermodels/CartProvider.dart';
import 'package:elmasreenapp/core/providermodels/CategoryProvider.dart';
import 'package:elmasreenapp/ui/componentui/AddToCartButtonUi.dart';
import 'package:elmasreenapp/ui/widgets/gotoCartButton.dart';
import 'package:elmasreenapp/utils/app_Localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Values.dart';
import 'DetailsOneItemProductUi.dart';
import 'LoadingUi.dart';
import 'LoginPageUI.dart';
import 'componentui/FavoriteButtonUi.dart';
import 'layout/NoProductFoundUI.dart';
import 'sidemenupages/NotificationSideMenuUi.dart';
import 'widgets/FavoriteCartWidgetItem.dart';

class CategoryMainUi extends StatefulWidget {
  final int id;
  final String title;

  const CategoryMainUi({Key key, this.id, this.title}) : super(key: key);

  @override
  _CategoryMainUiState createState() => _CategoryMainUiState();
}

class _CategoryMainUiState extends State<CategoryMainUi> {
  //List<ProductsCategory>
  final textSearch = TextEditingController();
  CategoryProvider categoryProviderMain;

  initCall() async {
    await Future.delayed(Duration(milliseconds: 100));
    categoryProviderMain =
        Provider.of<CategoryProvider>(context, listen: false);
    categoryProviderMain.initScrollMainProducts(widget.id);
    categoryProviderMain.getMainCategoryProductsFunction(widget.id);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initCall();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(resizeToAvoidBottomInset: false,
            appBar:PreferredSize(
                child: AppBar(automaticallyImplyLeading: false,
                    leading: Builder(
                      builder: (BuildContext context) {
                        return  IconButton(icon:Icon(Icons.arrow_back_ios,
                          color:Theme.of(context).accentColor, ), onPressed:(){
                          Navigator.of(context).pop();
                        });
                      },
                    ),shadowColor:Colors.grey.withOpacity(0.25) , iconTheme: IconThemeData(color:Colors.black,),
                    centerTitle: true,titleSpacing: 00.0,
                    title: Text(
                     widget.title.toString(),
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    elevation: 3.0,
                    backgroundColor: Colors.white,
                    actions: [
                      IconButton(
                          icon: ImageIcon(
                            AssetImage('assets/icons/notification.png'),
                            size: 20.0,
                            color: Colors.black,
                          ),
                          onPressed: () async {
                            SharedPreferences sh =
                            await SharedPreferences.getInstance();

                            if (sh.getString('token') != null) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NotificationSideMenuUi()),
                              );
                            } else {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => LoginPageUI()),
                                      (Route<dynamic> route) => false);
                            }
                          }) ,
                      GotoCart(),
                      SizedBox(width: 10.0,)// )
                    ]),
                preferredSize: Size.fromHeight(50.0)),
     // resizeToAvoidBottomPadding: false,
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Consumer<CategoryProvider>(
              builder: (context, categoryProvider, widgetUi) {
            return Column(
              children: [

                Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width * 0.03,
                  ),
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.width * 0.025,
                      left: MediaQuery.of(context).size.width * 0.05,
                      right: MediaQuery.of(context).size.width * 0.05),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,

                  )
//Theme.of(context).primaryColor
                  ,
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.only(left: 5.0, right: 5.0),
                        height: 45.0,
                        child: Row(
                          children: [
                            Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    color: darkColorUsed,
                                    borderRadius: BorderRadius.circular(50.0)),
                                child: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                )),
                            Expanded(
                                child: TextFormField(
                              textInputAction: TextInputAction.search,
                              onFieldSubmitted: (value) {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                categoryProvider.initScrollSearchMainProducts(
                                    widget.id, value.trim().toString());
                                categoryProvider
                                    .getSearchMainCategoryProductsFunction(
                                        widget.id,
                                        textSearch.text.trim().toString());
                              },
                              controller: textSearch,
                              style: TextStyle(fontSize: 12.0),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                      top: 0.0,
                                      bottom: 0.0,
                                      left: 5.0,
                                      right: 5.0),
                                  hintText: DemoLocalizations.of(context)
                                      .title['searchfromhere'],
                                  hintStyle: TextStyle(fontSize: 12.0),
                                  border: InputBorder.none),
                            )),
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50.0),
                            border: Border.all(width: 1, color: darkColorUsed)),
                      )),
//              IconButton(icon: ImageIcon(AssetImage('assets/icons/filter.png'), color:Color(0xff128226))
//              ,iconSize: 40.0,
//                onPressed: (){},),
                    ],
                  ),
                ),
                Expanded(
                    child: categoryProvider.showSearch
                        ? getFilterMainProducts()
                        : getMainProducts())
              ],
            );
          })),
    ));
  }

  Widget getMainProducts() {
    return Consumer<CategoryProvider>(
      builder: (context, categoryProvider, widgetUi) {
        return Container(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.05,
                right: MediaQuery.of(context).size.width * 0.05,
                top: MediaQuery.of(context).size.width * 0.05),
            child: categoryProvider.loadingFullMainProducts
                ? categoryProvider.itemsMainCategoryProducts.length > 0
                    ? Stack(
                        overflow: Overflow.visible,
                        children: [
                          Column(
                            children: [
                              Expanded(
                                  child: ListView.builder(
                                      controller: categoryProvider
                                          .scrollControllerMainProducts,
                                      itemCount: categoryProvider
                                          .itemsMainCategoryProducts.length,
                                      itemBuilder: (context, index) {
                                        return Consumer<CartProvider>(builder:
                                            (context, cartProvider,
                                                widgetItem) {
                                          return GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          DetailsOneItemProductUi(
                                                            oneProductModel:
                                                                categoryProvider
                                                                        .itemsMainCategoryProducts[
                                                                    index],
                                                            function: () {
                                                              cartProvider
                                                                  .updateFavorite();
                                                            },
                                                          )));
                                            },
                                            child: FavoriteCartWidgetItem(
                                              isSelected: 1,
                                              height: 100.0,
                                              property: SizedBox(),
                                              oldPrice: double.parse(
                                                  categoryProvider
                                                      .itemsMainCategoryProducts[
                                                          index]
                                                      .price),
                                              widgetTop: FavoriteButtonUi(
                                                backColor: Colors.grey
                                                    .withOpacity(0.5),
                                                oneProductModel: categoryProvider
                                                        .itemsMainCategoryProducts[
                                                    index],
                                              ),
                                              widget: AddToCartButtonUi(
                                                note: '',
                                                quantity: 1,
                                                widget: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.25,
                                                  padding: EdgeInsets.only(
                                                      left: 5.0,
                                                      right: 5.0,
                                                      top: 5.0,
                                                      bottom: 5.0),
                                                  alignment: Alignment.center,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.add,
                                                        color: Colors.white,
                                                        size: 12.0,
                                                      ),
                                                      SizedBox(
                                                        width: 3.0,
                                                      ),
                                                      Text(
                                                        DemoLocalizations.of(
                                                                context)
                                                            .title['addtoCart'],
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontSize: 10.0),
                                                      ),
                                                    ],
                                                  ),
                                                  decoration: BoxDecoration(
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0)),
                                                ),
                                                oneProductModel: categoryProvider
                                                        .itemsMainCategoryProducts[
                                                    index],
                                              ),
                                              title: categoryProvider
                                                  .itemsMainCategoryProducts[
                                                      index]
                                                  .name,
                                              price: double.parse(categoryProvider
                                                          .itemsMainCategoryProducts[
                                                              index]
                                                          .offerPrice
                                                          .toString() ==
                                                      ''
                                                  ? categoryProvider
                                                      .itemsMainCategoryProducts[
                                                          index]
                                                      .price
                                                      .toString()
                                                  : categoryProvider
                                                      .itemsMainCategoryProducts[
                                                          index]
                                                      .offerPrice
                                                      .toString()),
                                              description: categoryProvider
                                                  .itemsMainCategoryProducts[
                                                      index]
                                                  .desc,
                                              idProduct: categoryProvider
                                                  .itemsMainCategoryProducts[
                                                      index]
                                                  .id
                                                  .toString(),
                                              imgUrl: categoryProvider
                                                      .itemsMainCategoryProducts[
                                                          index]
                                                      .image ??
                                                  '',
                                              quantity: 1,
                                              type: 'cart',
                                            ),
                                          );
                                        });
                                      })),
                              categoryProvider.loadingMainProducts
                                  ? SizedBox(
                                      height: 40.0,
                                    )
                                  : SizedBox()
                            ],
                          ),
                          categoryProvider.loadingMainProducts
                              ? Align(
                                  alignment: Alignment.bottomCenter,
                                  child: CircularProgressIndicator(
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
                                  ))
                              : SizedBox()
                        ],
                      )
                    : NoProductFoundUI()
                : LoadingUi());
      },
    );
  }

  Widget getFilterMainProducts() {
    return Consumer<CategoryProvider>(
      builder: (context, categoryProvider, widgetUi) {
        return Container(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.05,
                right: MediaQuery.of(context).size.width * 0.05,
                top: MediaQuery.of(context).size.width * 0.05),
            child: categoryProvider.loadingSearchFullMainProducts
                ? categoryProvider.itemsSearchMainCategoryProducts.length > 0
                    ? Stack(
                        overflow: Overflow.visible,
                        children: [
                          Column(
                            children: [
                              Expanded(
                                  child: ListView.builder(
                                      controller: categoryProvider
                                          .scrollSearchControllerMainProducts,
                                      itemCount: categoryProvider
                                          .itemsSearchMainCategoryProducts
                                          .length,
                                      itemBuilder: (context, index) {
                                        return Consumer<CartProvider>(builder:
                                            (context, cartProvider,
                                                widgetItem) {
                                          return GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          DetailsOneItemProductUi(
                                                            oneProductModel:
                                                                categoryProvider
                                                                        .itemsSearchMainCategoryProducts[
                                                                    index],
                                                            function: () {
                                                              cartProvider
                                                                  .updateFavorite();
                                                            },
                                                          )));
                                            },
                                            child: FavoriteCartWidgetItem(
                                              isSelected: 1,
                                              height: 100.0,
                                              property: SizedBox(),
                                              oldPrice: double.parse(
                                                  categoryProvider
                                                      .itemsSearchMainCategoryProducts[
                                                          index]
                                                      .price),
                                              widgetTop: FavoriteButtonUi(
                                                backColor: Colors.grey
                                                    .withOpacity(0.5),
                                                oneProductModel: categoryProvider
                                                        .itemsSearchMainCategoryProducts[
                                                    index],
                                              ),
                                              widget: AddToCartButtonUi(
                                                note: '',
                                                quantity: 1,
                                                widget: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.25,
                                                  padding: EdgeInsets.only(
                                                      left: 5.0,
                                                      right: 5.0,
                                                      top: 5.0,
                                                      bottom: 5.0),
                                                  alignment: Alignment.center,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.add,
                                                        color: Colors.white,
                                                        size: 12.0,
                                                      ),
                                                      SizedBox(
                                                        width: 3.0,
                                                      ),
                                                      Text(
                                                        DemoLocalizations.of(
                                                                context)
                                                            .title['addtoCart'],
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontSize: 10.0),
                                                      ),
                                                    ],
                                                  ),
                                                  decoration: BoxDecoration(
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0)),
                                                ),
                                                oneProductModel: categoryProvider
                                                        .itemsSearchMainCategoryProducts[
                                                    index],
                                              ),
                                              title: categoryProvider
                                                  .itemsSearchMainCategoryProducts[
                                                      index]
                                                  .name,
                                              price: double.parse(categoryProvider
                                                          .itemsSearchMainCategoryProducts[
                                                              index]
                                                          .offerPrice
                                                          .toString() ==
                                                      ''
                                                  ? categoryProvider
                                                      .itemsSearchMainCategoryProducts[
                                                          index]
                                                      .price
                                                      .toString()
                                                  : categoryProvider
                                                      .itemsSearchMainCategoryProducts[
                                                          index]
                                                      .offerPrice
                                                      .toString()),
                                              description: categoryProvider
                                                  .itemsSearchMainCategoryProducts[
                                                      index]
                                                  .desc,
                                              idProduct: categoryProvider
                                                  .itemsSearchMainCategoryProducts[
                                                      index]
                                                  .id
                                                  .toString(),
                                              imgUrl: categoryProvider
                                                      .itemsSearchMainCategoryProducts[
                                                          index]
                                                      .image ??
                                                  '',
                                              quantity: 1,
                                              type: 'cart',
                                            ),
                                          );
                                        });
                                      })),
                              categoryProvider.loadingFullMainProducts
                                  ? SizedBox(
                                      height: 40.0,
                                    )
                                  : SizedBox()
                            ],
                          ),
                          categoryProvider.loadingSearchMainProducts
                              ? Align(
                                  alignment: Alignment.bottomCenter,
                                  child: CircularProgressIndicator(
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
                                  ))
                              : SizedBox()
                        ],
                      )
                    : NoProductFoundUI()
                : LoadingUi());
      },
    );
  }
}
