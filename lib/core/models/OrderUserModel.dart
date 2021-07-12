import 'dart:convert';

OrderUserModel orderUserModelFromJson(String str) => OrderUserModel.fromJson(json.decode(str));

String orderUserModelToJson(OrderUserModel data) => json.encode(data.toJson());

class OrderUserModel {
  OrderUserModel({
    this.userOrder,
    this.message,
    this.statusCode,
  });

  List<UserOrder> userOrder;
  String message;
  int statusCode;

  factory OrderUserModel.fromJson(Map<String, dynamic> json) => OrderUserModel(
    userOrder: json["UserOrder"] == null ? null : List<UserOrder>.from(json["UserOrder"].map((x) => UserOrder.fromJson(x))),
    message: json["message"] == null ? null : json["message"],
    statusCode: json["statusCode"] == null ? null : json["statusCode"],
  );

  Map<String, dynamic> toJson() => {
    "UserOrder": userOrder == null ? null : List<dynamic>.from(userOrder.map((x) => x.toJson())),
    "message": message == null ? null : message,
    "statusCode": statusCode == null ? null : statusCode,
  };
}

class UserOrder {
  UserOrder({
    this.id,
    this.address,
    this.paymentMethod,
    this.shippingMethod,
    this.productsPrice,
    this.paymentFees,
    this.shippingFees,
    this.taxFees,
    this.totalPrice,
    this.status,
    this.orderProductsQty,
    this.orderProducts,
  });

  int id;
  String address;
  String paymentMethod;
  String shippingMethod;
  String productsPrice;
  String paymentFees;
  String shippingFees;
  String taxFees;
  String totalPrice;
  String status;
  int orderProductsQty;
  List<OrderProduct> orderProducts;

  factory UserOrder.fromJson(Map<String, dynamic> json) => UserOrder(
    id: json["id"] == null ? null : json["id"],
    address: json["address"] == null ? null : json["address"],
    paymentMethod: json["payment_method"] == null ? null : json["payment_method"],
    shippingMethod: json["shipping_method"] == null ? null : json["shipping_method"],
    productsPrice: json["products_price"] == null ? null : json["products_price"],
    paymentFees: json["payment_fees"] == null ? null : json["payment_fees"],
    shippingFees: json["shipping_fees"] == null ? null : json["shipping_fees"],
    taxFees: json["tax_fees"] == null ? null : json["tax_fees"],
    totalPrice: json["total_price"] == null ? null : json["total_price"],
    status: json["status"] == null ? null : json["status"],
    orderProductsQty: json["orderProductsQty"] == null ? null : json["orderProductsQty"],
    orderProducts: json["orderProducts"] == null ? null : List<OrderProduct>.from(json["orderProducts"].map((x) => OrderProduct.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "address": address == null ? null : address,
    "payment_method": paymentMethod == null ? null : paymentMethod,
    "shipping_method": shippingMethod == null ? null : shippingMethod,
    "products_price": productsPrice == null ? null : productsPrice,
    "payment_fees": paymentFees == null ? null : paymentFees,
    "shipping_fees": shippingFees == null ? null : shippingFees,
    "tax_fees": taxFees == null ? null : taxFees,
    "total_price": totalPrice == null ? null : totalPrice,
    "status": status == null ? null : status,
    "orderProductsQty": orderProductsQty == null ? null : orderProductsQty,
    "orderProducts": orderProducts == null ? null : List<dynamic>.from(orderProducts.map((x) => x.toJson())),
  };
}

class OrderProduct {
  OrderProduct({
    this.id,
    this.name,
    this.image,
    this.price,
    this.quantity,
    this.orderProductAttributeValues,
  });

  int id;
  String name;
  String image;
  String price;
  int quantity;
  List<OrderProductAttributeValue> orderProductAttributeValues;

  factory OrderProduct.fromJson(Map<String, dynamic> json) => OrderProduct(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    image: json["image"] == null ? null : json["image"],
    price: json["price"] == null ? null : json["price"],
    quantity: json["quantity"] == null ? null : json["quantity"],
    orderProductAttributeValues: json["OrderProductAttributeValues"] == null ? null : List<OrderProductAttributeValue>.from(json["OrderProductAttributeValues"].map((x) => OrderProductAttributeValue.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "image": image == null ? null : image,
    "price": price == null ? null : price,
    "quantity": quantity == null ? null : quantity,
    "OrderProductAttributeValues": orderProductAttributeValues == null ? null : List<dynamic>.from(orderProductAttributeValues.map((x) => x.toJson())),
  };
}

class OrderProductAttributeValue {
  OrderProductAttributeValue({
    this.id,
    this.value,
  });

  int id;
  String value;

  factory OrderProductAttributeValue.fromJson(Map<String, dynamic> json) => OrderProductAttributeValue(
    id: json["id"] == null ? null : json["id"],
    value: json["value"] == null ? null : json["value"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "value": value == null ? null : value,
  };
}
