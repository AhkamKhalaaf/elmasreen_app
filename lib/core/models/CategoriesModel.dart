import 'dart:convert';

CategoriesModel categoriesModelFromJson(String str) => CategoriesModel.fromJson(json.decode(str));

String categoriesModelToJson(CategoriesModel data) => json.encode(data.toJson());

class CategoriesModel {
  CategoriesModel({
    this.categories,
    this.message,
    this.statusCode,
  });

  List<MainCategory> categories;
  String message;
  int statusCode;

  factory CategoriesModel.fromJson(Map<String, dynamic> json) => CategoriesModel(
    categories: json["categories"] == null ? null : List<MainCategory>.from(json["categories"].map((x) => MainCategory.fromJson(x))),
    message: json["message"] == null ? null : json["message"],
    statusCode: json["statusCode"] == null ? null : json["statusCode"],
  );

  Map<String, dynamic> toJson() => {
    "categories": categories == null ? null : List<dynamic>.from(categories.map((x) => x.toJson())),
    "message": message == null ? null : message,
    "statusCode": statusCode == null ? null : statusCode,
  };
}

class MainCategory {
  MainCategory({
    this.id,
    this.name,
    this.desc,
    this.image,
    this.home,
    this.menu,
    this.status,
    this.hasSub,
   });

  int id;
  String name;
  String desc;
  String image;
  String home;
  String menu;
  String status;
  String hasSub;

  factory MainCategory.fromJson(Map<String, dynamic> json) => MainCategory(
    id: json["id"] == null ? '' : json["id"],
    name: json["name"] == null ? '' : json["name"],
    desc: json["desc"] == null ? '' : json["desc"],
    image: json["image"] == null ? '' : json["image"],
    home: json["home"] == null ? '' : json["home"],
    menu: json["menu"] == null ? '' : json["menu"],
    status: json["status"] == null ? '' : json["status"],
    hasSub: json["has_sub"] == null ? '' : json["has_sub"],
   );

  Map<String, dynamic> toJson() => {
    "id": id == null ? '' : id,
    "name": name == null ? '' : name,
    "desc": desc == null ? '' : desc,
    "image": image == null ? '' : image,
    "home": home == null ? '' : home,
    "menu": menu == null ? '' : menu,
    "status": status == null ? '' : status,
    "has_sub": hasSub == null ? '' : hasSub,
   };
}
