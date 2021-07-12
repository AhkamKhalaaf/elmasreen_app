import 'dart:convert';

SideMenuPagesModel sideMenuPagesModelFromJson(String str) => SideMenuPagesModel.fromJson(json.decode(str));

String sideMenuPagesModelToJson(SideMenuPagesModel data) => json.encode(data.toJson());

class SideMenuPagesModel {
  SideMenuPagesModel({
    this.pages,
    this.message,
    this.statusCode,
  });

  List<OneSideMenuPage> pages;
  String message;
  int statusCode;

  factory SideMenuPagesModel.fromJson(Map<String, dynamic> json) => SideMenuPagesModel(
    pages: json["pages"] == null ? null : List<OneSideMenuPage>.from(json["pages"].map((x) => OneSideMenuPage.fromJson(x))),
    message: json["message"] == null ? null : json["message"],
    statusCode: json["statusCode"] == null ? null : json["statusCode"],
  );

  Map<String, dynamic> toJson() => {
    "pages": pages == null ? null : List<dynamic>.from(pages.map((x) => x.toJson())),
    "message": message == null ? null : message,
    "statusCode": statusCode == null ? null : statusCode,
  };
}

class OneSideMenuPage {
  OneSideMenuPage({
    this.id,
    this.title,
    this.text,
  });

  int id;
  String title;
  String text;

  factory OneSideMenuPage.fromJson(Map<String, dynamic> json) => OneSideMenuPage(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    text: json["text"] == null ? null : json["text"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "text": text == null ? null : text,
  };
}
