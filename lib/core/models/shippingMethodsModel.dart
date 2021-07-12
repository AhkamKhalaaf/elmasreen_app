import 'dart:convert';

ShippingMethodsModel shippingMethodsModelFromJson(String str) => ShippingMethodsModel.fromJson(json.decode(str));

String shippingMethodsModelToJson(ShippingMethodsModel data) => json.encode(data.toJson());

class ShippingMethodsModel {
  ShippingMethodsModel({
    this.shippingMethods,
    this.message,
    this.statusCode,
  });

  List<ShippingMethod> shippingMethods;
  String message;
  int statusCode;

  factory ShippingMethodsModel.fromJson(Map<String, dynamic> json) => ShippingMethodsModel(
    shippingMethods: json["shippingMethods"] == null ? null : List<ShippingMethod>.from(json["shippingMethods"].map((x) => ShippingMethod.fromJson(x))),
    message: json["message"] == null ? null : json["message"],
    statusCode: json["statusCode"] == null ? null : json["statusCode"],
  );

  Map<String, dynamic> toJson() => {
    "shippingMethods": shippingMethods == null ? null : List<dynamic>.from(shippingMethods.map((x) => x.toJson())),
    "message": message == null ? null : message,
    "statusCode": statusCode == null ? null : statusCode,
  };
}

class ShippingMethod {
  ShippingMethod({
    this.id,
    this.name,
    this.text,
    this.logo,
  });

  int id;
  String name;
  String text;
  String logo;

  factory ShippingMethod.fromJson(Map<String, dynamic> json) => ShippingMethod(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    text: json["text"] == null ? null : json["text"],
    logo: json["logo"] == null ? null : json["logo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "text": text == null ? null : text,
    "logo": logo == null ? null : logo,
  };
}
