import 'dart:convert';

import 'package:elmasreenapp/core/dblocal/AttributeDbModel.dart';
import 'package:elmasreenapp/core/dblocal/AttributeDbModelFake.dart';
import 'package:elmasreenapp/core/dblocal/CartLDBModel.dart';
import 'package:elmasreenapp/core/dblocal/dbHelper.dart';
import 'package:elmasreenapp/core/models/AboutAppModel.dart';
import 'package:elmasreenapp/core/models/HomeProductsCategoryModel.dart';
import 'package:elmasreenapp/core/models/OrderUserModel.dart';
import 'package:elmasreenapp/core/models/PaymentMethodsModel.dart';
import 'package:elmasreenapp/core/models/shippingMethodsModel.dart';
import 'package:elmasreenapp/ui/DetailsOneItemProductUi.dart';
import 'package:elmasreenapp/ui/LoginPageUI.dart';
import 'package:elmasreenapp/ui/stepspages/DetailsPageUi.dart';
import 'package:elmasreenapp/ui/stepspages/SuccessPageUi.dart';
import 'package:elmasreenapp/utils/app_Localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as httpRequest;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

import '../../Values.dart';

class CartProvider extends ChangeNotifier {
  AttributeValue selectedAttributeValue = AttributeValue();

  setAttributeSelected(AttributeValue value) {
    selectedAttributeValue = value;
    notifyListeners();
  }

  DbHelper dbHelper = DbHelper();
  double total;

  int quantity;

  double taxi;

  List items = [];
  int quantityDetailsProduct = 1;
  SettingsAppAbout mapAboutApp = SettingsAppAbout();

  //AttributeValue attributeSelected;
  int currentIndex = 0;
  Future<List<CartLDBModel>> itemsFavorite;
  List<AttributeLDBModel> itemsProperties = [];
  List<AttributeDbModelFake> itemsPropertiesFake = [];
  String shippingMethodSelected = '';
  String shippingMethodName = '';

  String paymentMethodSelected = '';
  String paymentMethodName = '';

  changePaymentMethod(String p, PaymentMethod paymentMethod) {
    paymentMethodSelected = p;
    paymentMethodName = paymentMethod.name.toString();
    notifyListeners();
    //print('${shippingMethodSelected}');
  }

  changeShippingMethod(String sh, ShippingMethod shippingMethod) {
    shippingMethodSelected = sh;
    shippingMethodName = shippingMethod.name.toString();
    notifyListeners();
    // print('${shippingMethodSelected}');
  }

  changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  getAboutApp() async {
    try {
      final response = await httpRequest.get('${urlBase}/aboutApp',
          headers: headersMapWithOutToken);

      if (response.body != null &&
          response.statusCode == 200 &&
          json.decode(response.body)['statusCode'] == 200) {
        //
        mapAboutApp =
            SettingsAppAbout.fromJson(json.decode(response.body)['settings']);
        notifyListeners();
        // print('${mapAboutApp.aboutApp},,,,,,settings');
      }
    } catch (e) {
      print('${e},,,error about');
    }
  }

  updateFavorite() {
    notifyListeners();
  }

//  changeOption(AttributeValue oneAttributeValue)
//  {
//
//    attributeSelected=oneAttributeValue;
//    notifyListeners();
//   }
  inQuantityDetailsProduct() {
    quantityDetailsProduct++;
    notifyListeners();
  }

  deQuantityDetailsProduct() {
    if (quantityDetailsProduct > 1) {
      quantityDetailsProduct--;
      notifyListeners();
    }
  }

  addPropertyToCart(int productID, int attributeId,
      AttributeValue attributeValue, var title) async {
    AttributeLDBModel attributeLDBModel = AttributeLDBModel({
      'productId': productID.toString(),
      'attributeId': attributeId.toString() + attributeValue.id.toString(),
      'id': attributeValue.id.toString(),
      'value': attributeValue.value,
      'price': 0.0,
      'title': title
    });
    try {
      await dbHelper.addAttributeLDBModelToCart(attributeLDBModel);
      await dbHelper.getAllAttributes();
      print('add property');
    } catch (e) {
      await dbHelper.updateAttributeLDBModel(attributeLDBModel);
      await dbHelper.getAllAttributes();
      print('update    property');
    }
  }

  updateOneItem(CartLDBModel cartLDBModel) async {
    await dbHelper.updateCartLDBModelItem(cartLDBModel);
    getAllProducts();
    getAllPropertiesProductFake(cartLDBModel.itemId.toString());
    notifyListeners();
  }

  getCountItems(List<CartLDBModel> itemsData) {
    total = 0.0;
    quantity = 0;
    taxi = 0.0;
    items = [];
    for (int i = 0; i < itemsData.length; i++) {
      // print('${itemsData[i].itemId},,,,,,,ininini');

      total = total +
          (itemsData[i].price == 0.0
              ? itemsData[i].oldPrice
              : itemsData[i].price * itemsData[i].quantity);
      quantity = quantity + itemsData[i].quantity;
    }
    taxi = total * (mapAboutApp.tax!=null?int.parse(mapAboutApp.tax):0 / 100);
    //print('${quantity},,,,,,,quantity last test ');
  }

  Future<List<AttributeLDBModel>> getAllPropertiesProduct(
      String productID) async {
    return dbHelper.getAllAttributesByProductId(productID);
  }

  Future<List<AttributeDbModelFake>> getAllPropertiesProductFake(
      String itemId) async {
    return dbHelper.getAllAttributesByProductIdFake(itemId);
  }

  Future<List<CartLDBModel>> getAllProducts() async {
    items = await dbHelper.allCartLDBModel();
    // print('${items.length},,,,,,,ffffffff');
    getCountItems(items);
    // print('${items.length},,,,,,,getalll');

    return dbHelper.allCartLDBModel();
  }

  Future<List<CartLDBModel>> getAllFavorite() async {
    itemsFavorite = dbHelper.getAllFavoriteDb();
    notifyListeners();
    return dbHelper.getAllFavoriteDb();
  }

  deleteAllAttributes() async {
    await dbHelper.deleteAllAttributes();
    await dbHelper.deleteAllAttributesFake();
    itemsProperties = [];
    itemsPropertiesFake = [];
    notifyListeners();
  }

  clearLocalDb() async {
    items = [];
    await deleteAllProductFunction();
    await deleteAllFavoriteFunction();
    await deleteAllAttributes();
  }

  deleteAllProductFunction() async {
    await dbHelper.deleteAllCartLDBModelItem();
  }

  deleteAllFavoriteFunction() async {
    await dbHelper.deleteAllFavoriteItem();
    notifyListeners();
  }

  deleteProduct(String itemId, String idProduct) async {
    await dbHelper.deleteCartLDBModelItem(itemId);
    await dbHelper.deleteAttributeLDBModelItem(itemId);
    await dbHelper.deleteAttributeLDBModelItemFake(itemId);

    await getAllProducts();
    notifyListeners();
   // print('done deletetete');
  }

  deleteFavorite(String productID) async {
    await dbHelper.deleteFavoriteItem(productID);
    await getAllFavorite();
    notifyListeners();
  }

  Future<int> getFavouriteStatus(String productId) async {
    bool found = await dbHelper.isProductFoundInFavouriteTable(productId);
    if (found == true) {
      return 1;
    } else {
      return 0;
    }
  }

  Future<int> triggerFavourite(
      BuildContext context, String productId, CartLDBModel cartLDBModel) async {
    int status = await getFavouriteStatus(productId);
    if (status == 0) {
      dbHelper.addFavoriteItem(cartLDBModel);
      Toast.show(DemoLocalizations.of(context).title['addtofavorite'], context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      return 1;
    } else {
      dbHelper.deleteFavoriteItem(productId);
      Toast.show(
          DemoLocalizations.of(context).title['removetofavorite'], context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      return 0;
    }
  }

  Future<void> checkAddProduct(
      BuildContext context, ProductsCategory oneProductModel, var note) async {
    String itemIdValue = '';
    itemsPropertiesFake = [];
    itemsProperties = [];
    itemsProperties = await dbHelper
        .getAllAttributesByProductId(oneProductModel.id.toString());
   // print('${itemsProperties.length},,,,,,itemsProperties');
    for (int i = 0; i < itemsProperties.length; i++) {
      itemIdValue = itemIdValue + itemsProperties[i].attributeId.toString();

    }


    int productQuantity = await dbHelper.isProductFoundInCartTable(
        oneProductModel.id.toString() + itemIdValue.toString());
   // print('${productQuantity},,,,,,,,,,productQuantity');

    if (productQuantity > 0) {

      CartLDBModel cartLDBModel = CartLDBModel({
        'itemId': oneProductModel.id.toString() + itemIdValue,
        'idProduct': oneProductModel.id.toString(),
        'quantity': productQuantity + 1,
        'price': oneProductModel.offerPrice != ''
            ? double.parse(oneProductModel.offerPrice)
            : 0.0,
        'oldprice': oneProductModel.price != ''
            ? double.parse(oneProductModel.price)
            : 0.0,
        'total': oneProductModel.offerPrice != ''
            ? double.parse(oneProductModel.offerPrice)
            : 0.0,
        'title': oneProductModel.name,
        'description': oneProductModel.desc,
        'img': oneProductModel.image ?? '',
        'note': note.toString(),
        'isSelected': 1
      });
      try {
        await dbHelper.updateCartLDBModelItem(cartLDBModel);
        await dbHelper.allCartLDBModel();
        showDialogResult(
            context,
            DemoLocalizations.of(context).title['productsusessadd'],
            (productQuantity + 1).toString());
      } catch (e) {
        Toast.show(DemoLocalizations.of(context).title['addedbefore'], context,
            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      }
    } else
      {
      for (int i = 0; i < itemsProperties.length; i++) {
        try {
          AttributeDbModelFake attributeDbModelFake = AttributeDbModelFake({
            'productId': oneProductModel.id.toString() + itemIdValue,
            'attributeId': itemsProperties[i].attributeId.toString(),
            'id': itemsProperties[i].id.toString(),
            'value': itemsProperties[i].value,
            'price': 0.0,
            'title': itemsProperties[i].title.toString()
          });
          await dbHelper.addAttributeLDBModelToCartFake(attributeDbModelFake);

        //  print('${oneProductModel.id.toString()},,,${itemIdValue},,,,,done add property fake');
        } catch (e) {
          AttributeDbModelFake attributeDbModelFake = AttributeDbModelFake({
            'productId': oneProductModel.id.toString() + itemIdValue,
            'attributeId': itemsProperties[i].attributeId.toString(),
            'id': itemsProperties[i].id.toString(),
            'value': itemsProperties[i].value,
            'price': 0.0,
            'title': itemsProperties[i].title.toString()
          });
          await dbHelper.updateAttributeLDBModelFake(attributeDbModelFake);

        //  print('update add property fake');
        }
      }
      await dbHelper.deleteAllAttributes();
      await dbHelper.getAllAttributesFake();
      CartLDBModel cartLDBModel = CartLDBModel({
        'itemId': oneProductModel.id.toString() + itemIdValue,
        'idProduct': oneProductModel.id.toString(),
        'quantity': 1,
        'price': oneProductModel.offerPrice != ''
            ? double.parse(oneProductModel.offerPrice)
            : 0.0,
        'oldprice': oneProductModel.price != ''
            ? double.parse(oneProductModel.price)
            : 0.0,
        'total': oneProductModel.offerPrice != ''
            ? double.parse(oneProductModel.offerPrice)
            : 0.0,
        'title': oneProductModel.name,
        'description': oneProductModel.desc,
        'img': oneProductModel.image ?? '',
        'note': note.toString(),
        'isSelected': 1
      });
      try {
        await dbHelper.addCartLDBModelToCart(cartLDBModel);
        await dbHelper.allCartLDBModel();
        //  await dbHelper.deleteAttributeLDBModelItem( oneProductModel.id.toString());
        //await dbHelper.getAllAttributesByProductId(oneProductModel.id.toString());
        showDialogResult(context,
            DemoLocalizations.of(context).title['productsusessadd'], '1');
      } catch (e) {
        //  print('${e},,,,,,errrrrrrrrrrr');

        Toast.show(DemoLocalizations.of(context).title['addedbefore'], context,
            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      }
    }

    await dbHelper.deleteAllAttributes();
    await dbHelper.getAllAttributes();
    await dbHelper.getAllAttributesFake();
    await getAllProducts();
    notifyListeners();

  }

  Future<void> checkTypeProduct(
      BuildContext context, ProductsCategory oneProductModel, var note) async {
    if (oneProductModel.hasAttributes == 1) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => DetailsOneItemProductUi(
                    oneProductModel: oneProductModel,
                    function: () {
                      updateFavorite();
                    },
                  )));
    } else {
      checkAddProduct(context, oneProductModel, note);
    }
  }

  checkFirstlyCartProducts(BuildContext context) async {
    SharedPreferences sh = await SharedPreferences.getInstance();

    if (sh.getString('token') != null) {
      List<dynamic> mainProducts = [];
      List<CartLDBModel> itemsDataProducts = [];
      itemsDataProducts = await getAllProducts();
      for (int i = 0; i < itemsDataProducts.length; i++) {
        mainProducts.add(int.parse(itemsDataProducts[i].idProduct.toString()));
      }
      var bodyItems = {"orderProducts": mainProducts};
      final response = await httpRequest.post('${urlBase}/checkCartProducts',
          body: json.encode(bodyItems), headers: await headerWithTokenOrder());

      if (response.statusCode == 200 && response.body != null) {
        if (json.decode(response.body)['statusCode'] == 200) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => DetailsPageUi()),
              (Route<dynamic> route) => false);
        } else {
          List items =
              json.decode(response.body)['notAvailableProductIds'].toList();
          for (int i = 0; i < itemsDataProducts.length; i++) {
            for (int j = 0; j < items.length; j++) {
              if (itemsDataProducts[i].idProduct == items[j].toString()) {
                CartLDBModel cartLDBModel = CartLDBModel({
                  'itemId': itemsDataProducts[i].itemId,
                  'idProduct': itemsDataProducts[i].idProduct,
                  'quantity': itemsDataProducts[i].quantity,
                  'price': itemsDataProducts[i].price.toString() != ''
                      ? double.parse(itemsDataProducts[i].price.toString())
                      : 0.0,
                  'oldprice': itemsDataProducts[i].oldPrice.toString() != ''
                      ? double.parse(itemsDataProducts[i].oldPrice.toString())
                      : 0.0,
                  'total': itemsDataProducts[i].price.toString() != ''
                      ? double.parse(itemsDataProducts[i].price.toString())
                      : 0.0,
                  'title': itemsDataProducts[i].title,
                  'description': itemsDataProducts[i].description,
                  'img': itemsDataProducts[i].img ?? '',
                  'note': itemsDataProducts[i].note.toString(),
                  'isSelected': 0
                });

                dbHelper.updateCartLDBModelItemByProductID(cartLDBModel);
              }
            }
          }
          await getAllProducts();

          showCardDialogFunction(context);
          notifyListeners();
        }
      }
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => LoginPageUI()),
          (Route<dynamic> route) => false);
    }
    ////
  }

  checkFirstlyConfirmCartProducts(BuildContext context) async {
    SharedPreferences sh = await SharedPreferences.getInstance();

    if (sh.getString('token') != null) {
      List<dynamic> mainProducts = [];
      List<CartLDBModel> itemsDataProducts = [];
      itemsDataProducts = await getAllProducts();
      for (int i = 0; i < itemsDataProducts.length; i++) {
        mainProducts.add(int.parse(itemsDataProducts[i].idProduct.toString()));
      }
      var bodyItems = {"orderProducts": mainProducts};
      // print('${json.encode(bodyItems)},,,,,,booooooody');
      final response = await httpRequest.post('${urlBase}/checkCartProducts',
          body: json.encode(bodyItems), headers: await headerWithTokenOrder());
      //   print('${json.decode(response.body)},,,,,,response');

      if (response.statusCode == 200 && response.body != null) {
        if (json.decode(response.body)['statusCode'] == 200) {
          placeOrderApi(context);
        } else {
          List items =
              json.decode(response.body)['notAvailableProductIds'].toList();
          for (int i = 0; i < itemsDataProducts.length; i++) {
            for (int j = 0; j < items.length; j++) {
              if (itemsDataProducts[i].idProduct == items[j].toString()) {
                CartLDBModel cartLDBModel = CartLDBModel({
                  'itemId': itemsDataProducts[i].itemId,
                  'idProduct': itemsDataProducts[i].idProduct,
                  'quantity': itemsDataProducts[i].quantity,
                  'price': itemsDataProducts[i].price.toString() != ''
                      ? double.parse(itemsDataProducts[i].price.toString())
                      : 0.0,
                  'oldprice': itemsDataProducts[i].oldPrice.toString() != ''
                      ? double.parse(itemsDataProducts[i].oldPrice.toString())
                      : 0.0,
                  'total': itemsDataProducts[i].price.toString() != ''
                      ? double.parse(itemsDataProducts[i].price.toString())
                      : 0.0,
                  'title': itemsDataProducts[i].title,
                  'description': itemsDataProducts[i].description,
                  'img': itemsDataProducts[i].img ?? '',
                  'note': itemsDataProducts[i].note.toString(),
                  'isSelected': 0
                });

                dbHelper.updateCartLDBModelItemByProductID(cartLDBModel);
              }
            }
          }
          await getAllProducts();

          showCardDialogFunction(context);
          notifyListeners();
        }
      }
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => LoginPageUI()),
          (Route<dynamic> route) => false);
    }
    ////
  }

  placeOrderApi(BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<dynamic> mainProducts = [];
    List<dynamic> mainAttributes = [];
     List<AttributeDbModelFake> attributesItemsOfOneProduct = [];
    List<CartLDBModel> itemsDataProducts = [];
    itemsDataProducts = await getAllProducts();
    for (int i = 0; i < itemsDataProducts.length; i++) {
      attributesItemsOfOneProduct = await dbHelper.getAllAttributesByProductIdFake(
          itemsDataProducts[i].itemId.toString());
      mainAttributes = [];
      for (int j = 0; j < attributesItemsOfOneProduct.length; j++) {
        mainAttributes.add({'value_id': attributesItemsOfOneProduct[j].id});
      }
      mainProducts.add({
        'product_id': int.parse(itemsDataProducts[i].idProduct.toString()),
        'quantity': itemsDataProducts[i].quantity,
        'price': itemsDataProducts[i].price,
        'note': itemsDataProducts[i].note,
        'attributeValues': mainAttributes
      });

      //   print('${itemsDataProducts[i].title}');
    }
    var bodyItems = {
      'products_price': total.toString(),
      'shipping_id': 1.toString(),
      'payment_id': 1.toString(),
      'address_id': sharedPreferences.getString('selectedId'),
      'orderProducts': mainProducts
    };
    //  print('${json.encode( bodyItems)},,,,,,,,,,fggggggggggg');
    final response = await httpRequest.post('${urlBase}/placeOrder',
        body: json.encode(bodyItems), headers: await headerWithTokenOrder());
    if (response.statusCode == 200 && response.body != null) {
      clearLocalDb();
      Toast.show(json.decode(response.body)['message'], context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => SuccessPageUi(
            map: json.decode(response.body),
          ),
          transitionDuration: Duration(seconds: 0),
        ),
      );
      //   backStepsFunction(context);

    }
  }

  Future<List<UserOrder>> getOrderUserData(var urlValue) async {
    try {
      final response = await httpRequest.get(
          '${urlBase}/orders?order_status=${urlValue}',
          headers: await headerWithToken());
      //  print('${bodyItems},,,,,,,body');

      print('${json.decode(response.body)},,,,,,,resres');
      if (response.statusCode == 200 && response.body != null) {
        if (json.decode(response.body)['statusCode'] == 200) {
          List dataItems = json.decode(response.body)['orders'];
          return dataItems.map((e) => UserOrder.fromJson(e)).toList();
        }
      }
    } catch (e) {
      print('${e},,,,user order');
    }
  }

  Future<List<ShippingMethod>> getShippingMethods() async {
    try {
      final response = await httpRequest.get('${urlBase}/getShippingMethods',
          headers: await headerWithToken());
      // print('${json.decode(response.body)},,,shhippng');
      if (response.statusCode == 200 && response.body != null) {
        List list = json.decode(response.body)['shippingMethods'];
        return list.map((e) => ShippingMethod.fromJson(e)).toList();
      }
    } catch (e) {
      print('${e},,,shiping method error');
    }
  }

  Future<List<PaymentMethod>> getPaymentMethods() async {
    try {
      final response = await httpRequest.get('${urlBase}/getPaymentMethods',
          headers: await headerWithToken());
      if (response.statusCode == 200 && response.body != null) {
        List list = json.decode(response.body)['paymentMethods'];
        return list.map((e) => PaymentMethod.fromJson(e)).toList();
      }
    } catch (e) {
      print('${e},,,shiping method error');
    }
  }
}
