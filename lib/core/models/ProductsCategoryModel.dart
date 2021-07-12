import 'dart:convert';

ProductsCategoryModel productsCategoryModelFromJson(String str) => ProductsCategoryModel.fromJson(json.decode(str));

String productsCategoryModelToJson(ProductsCategoryModel data) => json.encode(data.toJson());

class ProductsCategoryModel {
  ProductsCategoryModel({
    this.products,
    this.message,
    this.statusCode,
  });

  List<ProductsCategoryOffer> products;
  String message;
  int statusCode;

  factory ProductsCategoryModel.fromJson(Map<String, dynamic> json) => ProductsCategoryModel(
    products: json["products"] == null ? null : List<ProductsCategoryOffer>.from(json["products"].map((x) => ProductsCategoryOffer.fromJson(x))),
    message: json["message"] == null ? null : json["message"],
    statusCode: json["statusCode"] == null ? null : json["statusCode"],
  );

  Map<String, dynamic> toJson() => {
    "products": products == null ? null : List<dynamic>.from(products.map((x) => x.toJson())),
    "message": message == null ? null : message,
    "statusCode": statusCode == null ? null : statusCode,
  };
}

class ProductsCategoryOffer {
  ProductsCategoryOffer({
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
    this.productImages,
    this.productAttributes,
    this.precentageOffer
  });
//image
  int id;
  String name;
  String desc;
  String image;

  String categoryName;
  int categoryId;
  String brandName;
  int brandId;
  String colorName;
  int colorId;
  String code;
  String price;
  String offerPrice;
  int status;
  int hasAttributes;
  List<ProductImage> productImages;
  List<ProductAttribute> productAttributes;
  int precentageOffer;


  factory ProductsCategoryOffer.fromJson(Map<String, dynamic> json) => ProductsCategoryOffer(
    id: json["id"] == null ? "" : json["id"],
    name: json["name"] == null ? "" : json["name"],
    desc: json["desc"] == null ? "" : json["desc"],
    image: json["image"] == null ? "" : json["image"],
    categoryName: json["category_name"] == null ? "" : json["category_name"],
    categoryId: json["category_id"] == null ? "" : json["category_id"],
    brandName: json["brand_name"] == null ? "" : json["brand_name"],
    brandId: json["brand_id"] == null ? "" : json["brand_id"],
    colorName: json["color_name"] == null ? "" : json["color_name"],
    colorId: json["color_id"] == null ? "" : json["color_id"],
    code: json["code"] == null ? "" : json["code"],
    price: json["price"] == null ? "" : json["price"],
    offerPrice: json["offer_price"] == null ? "" : json["offer_price"],
    status: json["status"] == null ? null : json["status"],
    hasAttributes: json["has_attributes"] == null ? "" : json["has_attributes"],
    productImages: json["productImages"] == null ? "" : List<ProductImage>.from(json["productImages"].map((x) => ProductImage.fromJson(x))),
    productAttributes: json["productAttributes"] == "" ?
    null : List<ProductAttribute>.from(json["productAttributes"].map((x) => ProductAttribute.fromJson(x))),
    precentageOffer: json["precentage_offer"] == null ? "" : json["precentage_offer"],
  );
//image
  Map<String, dynamic> toJson() => {
    "id": id == null ? "" : id,
    "name": name == null ? "" : name,
    "desc": desc == null ? "" : desc,
    "image": desc == null ? "" : desc,
//precentage_offer
    "precentage_offer": precentageOffer == null ? "" : precentageOffer,

    "category_name": categoryName == null ? "" : categoryName,
    "category_id": categoryId == null ?"": categoryId,
    "brand_name": brandName == null ? "" : brandName,
    "brand_id": brandId == null ? "" : brandId,
    "color_name": colorName == null ? "" : colorName,
    "color_id": colorId == null ? "" : colorId,
    "code": code == null ? "" : code,
    "price": price == null ? " " : price,
    "offer_price": offerPrice == null ? " " : offerPrice,
    "status": status == null ? "" : status,
    "has_attributes": hasAttributes == null ? "" : hasAttributes,
    "productImages": productImages == null ? "" : List<dynamic>.from(productImages.map((x) => x.toJson())),
    "productAttributes": productAttributes == null ? "" : List<dynamic>.from(productAttributes.map((x) => x.toJson())),
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

  int id;
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
