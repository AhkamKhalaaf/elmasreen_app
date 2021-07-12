import 'dart:convert';

AreaModel areaModelFromJson(String str) => AreaModel.fromJson(json.decode(str));

String areaModelToJson(AreaModel data) => json.encode(data.toJson());

class AreaModel {
  AreaModel({
    this.areas,
    this.message,
    this.statusCode,
  });

  List<Area> areas;
  String message;
  int statusCode;

  factory AreaModel.fromJson(Map<String, dynamic> json) => AreaModel(
    areas: json["areas"] == null ? null : List<Area>.from(json["areas"].map((x) => Area.fromJson(x))),
    message: json["message"] == null ? null : json["message"],
    statusCode: json["statusCode"] == null ? null : json["statusCode"],
  );

  Map<String, dynamic> toJson() => {
    "areas": areas == null ? null : List<dynamic>.from(areas.map((x) => x.toJson())),
    "message": message == null ? null : message,
    "statusCode": statusCode == null ? null : statusCode,
  };
}

class Area {
  Area({
    this.id,
    this.name,
    this.status,
  });

  int id;
  String name;
  String status;

  factory Area.fromJson(Map<String, dynamic> json) => Area(
    id: json["id"] == null ? '' : json["id"],
    name: json["name"] == null ? '' : json["name"],
    status: json["status"] == null ? '' : json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? '' : id,
    "name": name == null ? '' : name,
    "status": status == null ? '' : status,
  };
}
