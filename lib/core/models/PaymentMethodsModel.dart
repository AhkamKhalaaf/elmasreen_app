import 'dart:convert';

PaymentMethodsModel paymentMethodsModelFromJson(String str) => PaymentMethodsModel.fromJson(json.decode(str));

String paymentMethodsModelToJson(PaymentMethodsModel data) => json.encode(data.toJson());

class PaymentMethodsModel {
  PaymentMethodsModel({
    this.paymentMethods,
    this.message,
    this.statusCode,
  });

  List<PaymentMethod> paymentMethods;
  String message;
  int statusCode;

  factory PaymentMethodsModel.fromJson(Map<String, dynamic> json) => PaymentMethodsModel(
    paymentMethods: json["paymentMethods"] == null ? null : List<PaymentMethod>.from(json["paymentMethods"].map((x) => PaymentMethod.fromJson(x))),
    message: json["message"] == null ? null : json["message"],
    statusCode: json["statusCode"] == null ? null : json["statusCode"],
  );

  Map<String, dynamic> toJson() => {
    "paymentMethods": paymentMethods == null ? null : List<dynamic>.from(paymentMethods.map((x) => x.toJson())),
    "message": message == null ? null : message,
    "statusCode": statusCode == null ? null : statusCode,
  };
}

class PaymentMethod {
  PaymentMethod({
    this.id,
    this.name,
    this.text,
    this.logo,
  });

  int id;
  String name;
  String text;
  String logo;

  factory PaymentMethod.fromJson(Map<String, dynamic> json) => PaymentMethod(
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
