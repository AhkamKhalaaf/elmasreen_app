import 'dart:convert';

RegionModel regionModelFromJson(String str) => RegionModel.fromJson(json.decode(str));

String regionModelToJson(RegionModel data) => json.encode(data.toJson());

class RegionModel {
  RegionModel({
    this.regions,
    this.message,
    this.statusCode,
  });

  List<Region> regions;
  String message;
  int statusCode;

  factory RegionModel.fromJson(Map<String, dynamic> json) => RegionModel(
    regions: json["regions"] == null ? '' : List<Region>.from(json["regions"].map((x) => Region.fromJson(x))),
    message: json["message"] == null ? '' : json["message"],
    statusCode: json["statusCode"] == null ? null : json["statusCode"],
  );

  Map<String, dynamic> toJson() => {
    "regions": regions == null ? '' : List<dynamic>.from(regions.map((x) => x.toJson())),
    "message": message == null ? '' : message,
    "statusCode": statusCode == null ? '' : statusCode,
  };
}

class Region {
  Region({
    this.id,
    this.name,
    this.status,
  });

  int id;
  String name;
  String status;

  factory Region.fromJson(Map<String, dynamic> json) => Region(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    status: json["status"] == null ? null : json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "status": status == null ? null : status,
  };
}
