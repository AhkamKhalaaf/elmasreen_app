// To parse this JSON data, do
//
//     final homeProductsCategoryModel = homeProductsCategoryModelFromJson(jsonString);

import 'dart:convert';

HomeProductsCategoryModel homeProductsCategoryModelFromJson(String str) => HomeProductsCategoryModel.fromJson(json.decode(str));

String homeProductsCategoryModelToJson(HomeProductsCategoryModel data) => json.encode(data.toJson());

class HomeProductsCategoryModel {
  HomeProductsCategoryModel({
    this.homeCategories,
    this.message,
    this.statusCode,
  });

  List<HomeCategory> homeCategories;
  String message;
  int statusCode;

  factory HomeProductsCategoryModel.fromJson(Map<String, dynamic> json) => HomeProductsCategoryModel(
    homeCategories: json["homeCategories"] == null ? null : List<HomeCategory>.from(json["homeCategories"].map((x) => HomeCategory.fromJson(x))),
    message: json["message"] == null ? null : json["message"],
    statusCode: json["statusCode"] == null ? null : json["statusCode"],
  );

  Map<String, dynamic> toJson() => {
    "homeCategories": homeCategories == null ? null : List<dynamic>.from(homeCategories.map((x) => x.toJson())),
    "message": message == null ? null : message,
    "statusCode": statusCode == null ? null : statusCode,
  };
}

class HomeCategory {
  HomeCategory({
    this.id,
    this.name,
    this.image,
    this.products,
  });

  int id;
  String name;
  String image;
  Products products;

  factory HomeCategory.fromJson(Map<String, dynamic> json) => HomeCategory(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    image: json["image"] == null ? null : json["image"],
    products: json["products"] == null ? null : Products.fromJson(json["products"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "image": image == null ? null : image,
    "products": products == null ? null : products.toJson(),
  };
}

class Products {
  Products({
    this.currentPage,
    this.productsCategory,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
    this.data,
  });

  int currentPage;
  List<ProductsCategory> productsCategory;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  String nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;
  List<ProductsCategory> data;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
    currentPage: json["current_page"] == null ? null : json["current_page"],
    productsCategory: json["ProductsCategory"] == null ? null : List<ProductsCategory>.from(json["ProductsCategory"].map((x) => ProductsCategory.fromJson(x))),
    firstPageUrl: json["first_page_url"] == null ? null : json["first_page_url"],
    from: json["from"] == null ? null : json["from"],
    lastPage: json["last_page"] == null ? null : json["last_page"],
    lastPageUrl: json["last_page_url"] == null ? null : json["last_page_url"],
    nextPageUrl: json["next_page_url"] == null ? null : json["next_page_url"],
    path: json["path"] == null ? null : json["path"],
    perPage: json["per_page"] == null ? null : json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"] == null ? null : json["to"],
    total: json["total"] == null ? null : json["total"],
    data: json["data"] == null ? null : List<ProductsCategory>.from(json["data"].map((x) => ProductsCategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage == null ? null : currentPage,
    "ProductsCategory": productsCategory == null ? null : List<dynamic>.from(productsCategory.map((x) => x.toJson())),
    "first_page_url": firstPageUrl == null ? null : firstPageUrl,
    "from": from == null ? null : from,
    "last_page": lastPage == null ? null : lastPage,
    "last_page_url": lastPageUrl == null ? null : lastPageUrl,
    "next_page_url": nextPageUrl == null ? null : nextPageUrl,
    "path": path == null ? null : path,
    "per_page": perPage == null ? null : perPage,
    "prev_page_url": prevPageUrl,
    "to": to == null ? null : to,
    "total": total == null ? null : total,
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class ProductsCategory {
  ProductsCategory({
    this.id,
    this.name,
    this.desc,
    this.image,
    this.categoryName,
    this.categoryId,
    this.brandName,
    this.brandId,
    this.colorName,
    this.colorId,
    this.code,
    this.price,
    this.offerPrice,
    this.status,
    this.hasAttributes,
    this.precentageOffer,
    this.productImages,
    this.productAttributes,
  });

  int id;
  String name;
  String desc;
  String image;
  String categoryName;
  String categoryId;
  String brandName;
  String brandId;
  String colorName;
  String colorId;
  String code;
  String price;
  String offerPrice;
  String status;
  int hasAttributes;
  int precentageOffer;
  List<ProductImage> productImages;
  List<ProductAttribute> productAttributes;

  factory ProductsCategory.fromJson(Map<String, dynamic> json) => ProductsCategory(
    id: json["id"] == null ? '' : json["id"],
    name: json["name"] == null ? '' : json["name"],
    desc: json["desc"] == null ? '' : json["desc"],
    image: json["image"] == null ? '' : json["image"],
    categoryName: json["category_name"] == null ? '' : json["category_name"],
    categoryId: json["category_id"] == null ? '' : json["category_id"],
    brandName: json["brand_name"] == null ? '' : json["brand_name"],
    brandId: json["brand_id"] == null ? '' : json["brand_id"],
    colorName: json["color_name"] == null ? '' : json["color_name"],
    colorId: json["color_id"] == null ? '' : json["color_id"],
    code: json["code"] == null ? '' : json["code"],
    price: json["price"] == null ? '' : json["price"],
    offerPrice: json["offer_price"] == null ? '' : json["offer_price"],
    status: json["status"] == null ? '' : json["status"],
    hasAttributes: json["has_attributes"] == null ? '' : json["has_attributes"],
    precentageOffer: json["precentage_offer"] == null ? '' : json["precentage_offer"],
    productImages: json["productImages"] == null ? '' : List<ProductImage>.from(json["productImages"].map((x) => ProductImage.fromJson(x))),
    productAttributes: json["productAttributes"] == null ? '' : List<ProductAttribute>.from(json["productAttributes"].map((x) => ProductAttribute.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "desc": desc == null ? null : desc,
    "image": image == null ? null : image,
    "category_name": categoryName == null ? null : categoryName,
    "category_id": categoryId == null ? null : categoryId,
    "brand_name": brandName == null ? null : brandName,
    "brand_id": brandId == null ? null : brandId,
    "color_name": colorName == null ? null : colorName,
    "color_id": colorId == null ? null : colorId,
    "code": code == null ? null : code,
    "price": price == null ? null : price,
    "offer_price": offerPrice == null ? null : offerPrice,
    "status": status == null ? null : status,
    "has_attributes": hasAttributes == null ? null : hasAttributes,
    "precentage_offer": precentageOffer == null ? null : precentageOffer,
    "productImages": productImages == null ? null : List<dynamic>.from(productImages.map((x) => x.toJson())),
    "productAttributes": productAttributes == null ? null : List<dynamic>.from(productAttributes.map((x) => x.toJson())),
  };
}

class ProductAttribute {
  ProductAttribute({
    this.id,
    this.name,
    this.icon,
    this.status,
    this.attributeValues,
  });

  int id;
  String name;
  String icon;
  int status;
  List<AttributeValue> attributeValues;

  factory ProductAttribute.fromJson(Map<String, dynamic> json) => ProductAttribute(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    icon: json["icon"] == null ? null : json["icon"],
    status: json["status"] == null ? null : json["status"],
    attributeValues: json["attributeValues"] == null ? null : List<AttributeValue>.from(json["attributeValues"].map((x) => AttributeValue.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "icon": icon == null ? null : icon,
    "status": status == null ? null : status,
    "attributeValues": attributeValues == null ? null : List<dynamic>.from(attributeValues.map((x) => x.toJson())),
  };
}

class AttributeValue {
  AttributeValue({
    this.id,
    this.value,
  });

  String id;
  String value;

  factory AttributeValue.fromJson(Map<String, dynamic> json) => AttributeValue(
    id: json["id"] == null ? null : json["id"],
    value: json["value"] == null ? null : json["value"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "value": value == null ? null : value,
  };
}

class ProductImage {
  ProductImage({
    this.image,
  });

  String image;

  factory ProductImage.fromJson(Map<String, dynamic> json) => ProductImage(
    image: json["image"] == null ? null : json["image"],
  );

  Map<String, dynamic> toJson() => {
    "image": image == null ? null : image,
  };
}
