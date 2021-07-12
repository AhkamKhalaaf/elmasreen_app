import 'dart:convert';

NotificationsModel notificationsModelFromJson(String str) => NotificationsModel.fromJson(json.decode(str));

String notificationsModelToJson(NotificationsModel data) => json.encode(data.toJson());

class NotificationsModel {
  NotificationsModel({
    this.notifications,
    this.message,
    this.statusCode,
  });

  List<NotificationItemModel> notifications;
  String message;
  int statusCode;

  factory NotificationsModel.fromJson(Map<String, dynamic> json) => NotificationsModel(
    notifications: json["notifications"] == null ? null : List<NotificationItemModel>.from(json["notifications"].map((x) => NotificationsModel.fromJson(x))),
    message: json["message"] == null ? null : json["message"],
    statusCode: json["statusCode"] == null ? null : json["statusCode"],
  );

  Map<String, dynamic> toJson() => {
    "notifications": notifications == null ? null : List<dynamic>.from(notifications.map((x) => x.toJson())),
    "message": message == null ? null : message,
    "statusCode": statusCode == null ? null : statusCode,
  };
}

class NotificationItemModel {
  NotificationItemModel({
    this.id,
    this.title,
    this.text,
    this.dateTime,
  });

  int id;
  String title;
  String text;
  String dateTime;

  factory NotificationItemModel.fromJson(Map<String, dynamic> json) => NotificationItemModel(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    text: json["text"] == null ? null : json["text"],
    dateTime: json["dateTime"] == null ? null : json["dateTime"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "text": text == null ? null : text,
    "dateTime": dateTime == null ? null : dateTime,
  };
}
