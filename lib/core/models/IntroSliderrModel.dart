import 'dart:convert';

IntroSliderrModel introSliderrModelFromJson(String str) => IntroSliderrModel.fromJson(json.decode(str));

String introSliderrModelToJson(IntroSliderrModel data) => json.encode(data.toJson());

class IntroSliderrModel {
  IntroSliderrModel({
    this.oneSlider,
    this.message,
    this.statusCode,
  });

  List<OneSlider> oneSlider;
  String message;
  int statusCode;

  factory IntroSliderrModel.fromJson(Map<String, dynamic> json) => IntroSliderrModel(
    oneSlider: List<OneSlider>.from(json["OneSlider"].map((x) => OneSlider.fromJson(x))),
    message: json["message"],
    statusCode: json["statusCode"],
  );

  Map<String, dynamic> toJson() => {
    "OneSlider": List<dynamic>.from(oneSlider.map((x) => x.toJson())),
    "message": message,
    "statusCode": statusCode,
  };
}

class OneSlider {
  OneSlider({
    this.id,
    this.title,
    this.text,
    this.image,
    this.link,
    this.order,
  });

  int id;
  String title;
  String text;
  String image;
  dynamic link;
  String order;

  factory OneSlider.fromJson(Map<String, dynamic> json) => OneSlider(
    id: json["id"],
    title: json["title"],
    text: json["text"],
    image: json["image"],
    link: json["link"],
    order: json["order"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "text": text,
    "image": image,
    "link": link,
    "order": order,
  };
}
