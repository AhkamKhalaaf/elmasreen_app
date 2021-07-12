import 'dart:convert';

AssressUser assressUserFromJson(String str) => AssressUser.fromJson(json.decode(str));

String assressUserToJson(AssressUser data) => json.encode(data.toJson());

class AssressUser {
  AssressUser({
    this.addressesUser,
    this.message,
    this.statusCode,
  });

  List<AddressesUser> addressesUser;
  String message;
  int statusCode;

  factory AssressUser.fromJson(Map<String, dynamic> json) => AssressUser(
    addressesUser: json["AddressesUser"] == null ? null : List<AddressesUser>.from(json["AddressesUser"].map((x) => AddressesUser.fromJson(x))),
    message: json["message"] == null ? null : json["message"],
    statusCode: json["statusCode"] == null ? null : json["statusCode"],
  );

  Map<String, dynamic> toJson() => {
    "AddressesUser": addressesUser == null ? null : List<dynamic>.from(addressesUser.map((x) => x.toJson())),
    "message": message == null ? null : message,
    "statusCode": statusCode == null ? null : statusCode,
  };
}

class AddressesUser {
  AddressesUser({
    this.id,
    this.addressTitle,
    this.address,
    this.landMark,
    this.phone1,
    this.phone2,
    this.lat,
    this.lng,
    this.countryId,
    this.regionId,
    this.areaId,
    this.country,
    this.region,
    this.area,
    this.isPrimary,
  });

  int id;
  String addressTitle;
  String address;
  String landMark;
  String phone1;
  String phone2;
  String lat;
  String lng;
  String countryId;
  String regionId;
  String areaId;
  String country;
  String region;
  String area;
  String isPrimary;

  factory AddressesUser.fromJson(Map<String, dynamic> json) => AddressesUser(
    id: json["id"] == null ? null : json["id"],
    addressTitle: json["address_title"] == null ? null : json["address_title"],
    address: json["address"] == null ? null : json["address"],
    landMark: json["land_mark"] == null ? null : json["land_mark"],
    phone1: json["phone1"] == null ? null : json["phone1"],
    phone2: json["phone2"] == null ? null : json["phone2"],
    lat: json["lat"] == null ? null : json["lat"],
    lng: json["lng"] == null ? null : json["lng"],
    countryId: json["country_id"] == null ? null : json["country_id"],
    regionId: json["region_id"] == null ? null : json["region_id"],
    areaId: json["area_id"] == null ? null : json["area_id"],
    country: json["country"] == null ? null : json["country"],
    region: json["region"] == null ? null : json["region"],
    area: json["area"] == null ? null : json["area"],
    isPrimary: json["is_primary"] == null ? null : json["is_primary"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "address_title": addressTitle == null ? null : addressTitle,
    "address": address == null ? null : address,
    "land_mark": landMark == null ? null : landMark,
    "phone1": phone1 == null ? null : phone1,
    "phone2": phone2 == null ? null : phone2,
    "lat": lat == null ? null : lat,
    "lng": lng == null ? null : lng,
    "country_id": countryId == null ? null : countryId,
    "region_id": regionId == null ? null : regionId,
    "area_id": areaId == null ? null : areaId,
    "country": country == null ? null : country,
    "region": region == null ? null : region,
    "area": area == null ? null : area,
    "is_primary": isPrimary == null ? null : isPrimary,
  };
}
