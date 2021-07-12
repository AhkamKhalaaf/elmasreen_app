import 'dart:convert';

AboutAppModel aboutAppModelFromJson(String str) => AboutAppModel.fromJson(json.decode(str));

String aboutAppModelToJson(AboutAppModel data) => json.encode(data.toJson());

class AboutAppModel {
  AboutAppModel({
    this.settingsAppAbout,
    this.message,
    this.statusCode,
  });

  SettingsAppAbout settingsAppAbout;
  String message;
  int statusCode;

  factory AboutAppModel.fromJson(Map<String, dynamic> json) => AboutAppModel(
    settingsAppAbout: SettingsAppAbout.fromJson(json["SettingsAppAbout"]),
    message: json["message"],
    statusCode: json["statusCode"],
  );

  Map<String, dynamic> toJson() => {
    "SettingsAppAbout": settingsAppAbout.toJson(),
    "message": message,
    "statusCode": statusCode,
  };
}

class SettingsAppAbout {
  SettingsAppAbout({
    this.id,
    this.appName,
    this.aboutApp,
    this.appLogo,
    this.tax,
    this.lat,
    this.lng,
    this.email,
    this.contactEmail,
    this.mobile,
    this.telphone,
    this.fax,
    this.facebook,
    this.twitter,
    this.instgram,
    this.linkedin,
    this.sanpchat,
    this.address1,
    this.address2,
  });

  int id;
  String appName;
  String aboutApp;
  String appLogo;
  String tax;
  String lat;
  String lng;
  String email;
  String contactEmail;
  String mobile;
  String telphone;
  String fax;
  String facebook;
  String twitter;
  String instgram;
  String linkedin;
  String sanpchat;
  String address1;
  String address2;

  factory SettingsAppAbout.fromJson(Map<String, dynamic> json) => SettingsAppAbout(
    id: json["id"],
    appName: json["app_name"],
    aboutApp: json["about_app"],
    appLogo: json["app_logo"],
    tax: json["tax"],
    lat: json["lat"],
    lng: json["lng"],
    email: json["email"],
    contactEmail: json["contact_email"],
    mobile: json["mobile"],
    telphone: json["telphone"],
    fax: json["fax"],
    facebook: json["facebook"],
    twitter: json["twitter"],
    instgram: json["instgram"],
    linkedin: json["linkedin"],
    sanpchat: json["sanpchat"],
    address1: json["address1"],
    address2: json["address2"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "app_name": appName,
    "about_app": aboutApp,
    "app_logo": appLogo,
    "tax": tax,
    "lat": lat,
    "lng": lng,
    "email": email,
    "contact_email": contactEmail,
    "mobile": mobile,
    "telphone": telphone,
    "fax": fax,
    "facebook": facebook,
    "twitter": twitter,
    "instgram": instgram,
    "linkedin": linkedin,
    "sanpchat": sanpchat,
    "address1": address1,
    "address2": address2,
  };
}
