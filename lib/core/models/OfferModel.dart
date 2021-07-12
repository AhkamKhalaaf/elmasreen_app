import 'dart:convert';

import 'ProductsCategoryModel.dart';

OfferModel offerModelFromJson(String str) => OfferModel.fromJson(json.decode(str));

String offerModelToJson(OfferModel data) => json.encode(data.toJson());

class OfferModel {
  OfferModel({
    this.productOffers,
    this.message,
    this.statusCode,
  });

  ProductOffers productOffers;
  String message;
  int statusCode;

  factory OfferModel.fromJson(Map<String, dynamic> json) => OfferModel(
    productOffers: json["productOffers"] == null ? null : ProductOffers.fromJson(json["productOffers"]),
    message: json["message"] == null ? null : json["message"],
    statusCode: json["statusCode"] == null ? null : json["statusCode"],
  );

  Map<String, dynamic> toJson() => {
    "productOffers": productOffers == null ? null : productOffers.toJson(),
    "message": message == null ? null : message,
    "statusCode": statusCode == null ? null : statusCode,
  };
}

class ProductOffers {
  ProductOffers({
    this.currentPage,
    this.oneOffer,
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
  });

  int currentPage;
  List<ProductsCategoryOffer> oneOffer;
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

  factory ProductOffers.fromJson(Map<String, dynamic> json) => ProductOffers(
    currentPage: json["current_page"] == null ? null : json["current_page"],
    oneOffer: json["OneOffer"] == null ? null : List<ProductsCategoryOffer>.from(json["OneOffer"].map((x) => ProductsCategoryOffer.fromJson(x))),
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
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage == null ? null : currentPage,
    "OneOffer": oneOffer == null ? null : List<dynamic>.from(oneOffer.map((x) => x.toJson())),
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
  };
}
