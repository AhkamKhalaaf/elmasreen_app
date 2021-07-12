import 'dart:convert';
import 'package:elmasreenapp/core/models/CategoriesModel.dart';
import 'package:elmasreenapp/core/models/HomeProductsCategoryModel.dart';

     import 'package:elmasreenapp/core/models/SubCategoriesModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as httpRequest;

import '../../Values.dart';

//
class CategoryProvider extends ChangeNotifier {
  bool showSearch=false;
  int page = 1;
  int pageMainProducts = 1;
  int pageSearchMainProducts=1;
  ProductsCategory oneItemProductDetails;
  Future<List<SubCategory>> itemsSubCategory;
  bool mainSubCategoryState = false;

  //ProductsCategory
  List<ProductsCategory> itemsOffers=[];
  List<ProductsCategory> itemsMainCategoryProducts=[];
  List<ProductsCategory> itemsSearchMainCategoryProducts=[];

  bool loadingSearchFullMainProducts = false;

  bool loadingFullMainProducts = false;
  bool loadingMainProducts = false;
  //
  bool loadingSearchMainProducts = false;

  bool loadingFilterMainProducts = false;

  bool loadingOffers = false;
  bool loadingFullOffers = false;
  ScrollController scrollControllerMainProducts= new ScrollController();
  ScrollController scrollSearchControllerMainProducts= new ScrollController();

  ScrollController scrollControllerOffers = new ScrollController();

  Future<List<MainCategory>> getMainCategory() async {
    try {
      final response = await httpRequest.get('${urlBase}/getCategories',
          headers: headersMapWithOutToken);

      if (response.body != null && response.statusCode == 200) {
        List data = json.decode(response.body)['categories'];
        return data.map((e) => MainCategory.fromJson(e)).toList();
      }
    } catch (e) {
      print('${e},,,,maincategory error');
    }
  }

  Future<List<SubCategory>> getSubCategory(int id) async {
    try {
      var bodyValue = {'category_id': id.toString()};
      final response = await httpRequest.post('${urlBase}/getSubCategories',
          body: bodyValue, headers: headersMapWithOutToken);

      if (response.body != null && response.statusCode == 200) {
        List data = json.decode(response.body)['categories'];
        return data.map((e) => SubCategory.fromJson(e)).toList();
      }
    } catch (e) {
      print('${e},,,,maincategory error');
    }
  }



  emptyOneItemProductDetails() {
    oneItemProductDetails = null;
    notifyListeners();
  }

  getProductFunction(var id) async {
    var body = {'product_id': id.toString()};
    try {
      final response = await httpRequest.post('${urlBase}/getProduct',
          body: body, headers: headersMapWithOutToken);
      //print('${json.decode(response.body)},,,respososo');
      if (response.statusCode == 200 && response.body != null) {
        oneItemProductDetails =
            ProductsCategory.fromJson(json.decode(response.body)['product']);
        notifyListeners();
      }
    } catch (e) {
      print('${e},,,,,error get product');
    }
  }

//ProductsCategory
  Future<List<HomeCategory>> getHomeCategoriesProducts() async {
    try {
      final response = await httpRequest.get(
          '${urlBase}/getHomeCategoriesProducts',
          headers: headersMapWithOutToken);

      if (response.statusCode == 200 && response.body != null) {
        List data = json.decode(response.body)['homeCategories'];
      // print('${data.map((e) => HomeCategory.fromJson(e)).toList().length},,,,  home products');
        return data.map((e) => HomeCategory.fromJson(e)).toList();
      }
    } catch (e) {
      print('${e},,,,error home products');
    }
  }

  initScrollOffers() async {
    showSearch=false;
    notifyListeners();
    scrollControllerOffers.addListener(() async {
      if (scrollControllerOffers.position.pixels ==
          scrollControllerOffers.position.maxScrollExtent) {
        loadingOffers = true;
        page = page + 1;
        notifyListeners();
        itemsOffers.addAll(await getOffersProductsApi(page));
        loadingOffers = false;
        notifyListeners();
        print('${itemsOffers.length},,aaaaa');
      }
    });
  }
  initScrollSearchMainProducts(int id,String keySearch) async {
    showSearch=true;
     notifyListeners();
    scrollSearchControllerMainProducts.addListener(() async {
      if (scrollSearchControllerMainProducts.position.pixels ==
          scrollSearchControllerMainProducts.position.maxScrollExtent) {
        loadingSearchMainProducts = true;
        pageSearchMainProducts = pageSearchMainProducts + 1;
        notifyListeners();
        itemsSearchMainCategoryProducts.addAll(await getSearchCategoryProductsApi(id,keySearch));
        loadingSearchMainProducts = false;
        notifyListeners();
        print('${itemsSearchMainCategoryProducts.length},,,,,,SearchmainProduct');
      }
    });
  }
  Future<void> getSearchMainCategoryProductsFunction(int id,String keySearch) async {
    pageSearchMainProducts = 1;
    loadingSearchFullMainProducts = false;
    notifyListeners();
    itemsSearchMainCategoryProducts = await getSearchCategoryProductsApi(id,keySearch);
    loadingSearchFullMainProducts = true;
    notifyListeners();
  }
  initScrollMainProducts(int id) async {
    showSearch=false;
    notifyListeners();
    scrollControllerMainProducts.addListener(() async {
      if (scrollControllerMainProducts.position.pixels ==
          scrollControllerMainProducts.position.maxScrollExtent) {
        loadingMainProducts = true;
        pageMainProducts = pageMainProducts + 1;
        notifyListeners();
        itemsMainCategoryProducts.addAll(await getCategoryProductsApi(id));
        loadingMainProducts = false;
        notifyListeners();
        print('${itemsMainCategoryProducts.length},,,,,,mainProduct');
      }
    });
  }

  Future<void> getMainCategoryProductsFunction(int id) async {
    pageMainProducts = 1;
    loadingFullMainProducts = false;
    notifyListeners();
    itemsMainCategoryProducts = await getCategoryProductsApi(id);
    loadingFullMainProducts = true;
    notifyListeners();
  }
  Future<void> getOffersFunction() async {
    page = 1;
    loadingFullOffers = false;
    notifyListeners();
    itemsOffers = await getOffersProductsApi(page);
    loadingFullOffers = true;
    notifyListeners();
  }

  Future<void> getOffersPagination() async {
    loadingOffers = true;
    notifyListeners();
  }

  Future<List<ProductsCategory>> getOffersProductsApi(int num) async {
    try {
      final response = await httpRequest.get(
          '${urlBase}/getProductOffers?page=${num}',
          headers: headersMapWithOutToken);
      if (response.statusCode == 200 && response.body != null) {
        List data = json.decode(response.body)['productOffers']['data'];

        print('${data.length},,,,,,,,ststs');
        print('${page},,,,,,,,page');
        return data.map((e) => ProductsCategory.fromJson(e)).toList();
      }
    } catch (e) {
      print('${e},,,,error offerrs');
    }
    loadingOffers = false;
    notifyListeners();
  }


  Future<List<ProductsCategory>> getCategoryProductsApi(int id) async {
    try {
      var bodyValue = {'category_id': id.toString()};
      final response = await httpRequest.post('${urlBase}/getCategoryProducts?page=${pageMainProducts}',
          body: bodyValue, headers: headersMapWithOutToken);
     print('${json.decode(response.body)},,,,mainprodutcategory error');
      if (response.body != null && response.statusCode == 200) {
        List data = json.decode(response.body)['products']['data'];
        return data.map((e) => ProductsCategory.fromJson(e)).toList();
      }
    } catch (e) {
      print('${e},,,,mainprodutcategory error');
    }
  }

  Future<List<ProductsCategory>> getSearchCategoryProductsApi(int id,String keySearch) async {
    try {
      var bodyValue = {
        "category_id":id.toString(),
        "name":keySearch,
        "valueIds":[

        ]
      };
       final response = await httpRequest.post('${urlBase}/FilterCategoryProducts?page=${pageSearchMainProducts}',
          body: json.encode(bodyValue), headers: headersMapContentType);

      print('${json.encode(bodyValue)},,,,json.encode(bodyValue)  ');
       if (response.body != null && response.statusCode == 200) {
        List data = json.decode(response.body)['filterdProducts']['data'];
        return data.map((e) => ProductsCategory.fromJson(e)).toList();
      }
    } catch (e) {
      print('${e},,,,filterdProducts error');
    }
  }
}
