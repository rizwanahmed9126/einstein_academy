// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

NotificationModel notificationModelFromJson(String str) => NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) => json.encode(data.toJson());

// class NotificationModel {
//   NotificationModel({
//     @required this.status,
//     @required this.message,
//     @required this.data,
//     @required this.code,
//   });
//
//   String status;
//   String message;
//   List<Datum> data;
//   int code;
//
//   factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
//     status: json["status"],
//     message: json["message"],
//     data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//     code: json["code"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "message": message,
//     "data": List<dynamic>.from(data.map((x) => x.toJson())),
//     "code": code,
//   };
// }

class NotificationModel {
  NotificationModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
    required this.img,
    required this.updatedAt,
    required this.createdAt,
  });

  int id;
  int userId;
  String title;
  String body;
  dynamic img;
  DateTime updatedAt;
  DateTime createdAt;

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    id: json["id"],
    userId: json["user_id"],
    title: json["title"],
    body: json["body"],
    img: json["img"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "title": title,
    "body": body,
    "img": img,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
  };
}
