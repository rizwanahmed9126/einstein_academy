// To parse this JSON data, do
//
//     final joinZoomMeetingModel = joinZoomMeetingModelFromJson(jsonString);

import 'dart:convert';

import 'package:einstien_academy_flutter/models/student_notes_detail_model.dart';

ZoomMeetingModel joinZoomMeetingModelFromJson(String str) => ZoomMeetingModel.fromJson(json.decode(str));

String joinZoomMeetingModelToJson(ZoomMeetingModel data) => json.encode(data.toJson());


class ZoomMeetingModel {
  ZoomMeetingModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
    required this.dateAndTime,
    required this.meetingId,
    required this.img,
    required this.createdAt,
    required this.updatedAt,
    required this.meetingPass,
    required this.user
  });

  int id;
  int userId;
  String title;
  String description;
  String dateAndTime;
  dynamic meetingId;
  dynamic img;
  String createdAt;
  String updatedAt;
  dynamic meetingPass;
  User user;

  factory ZoomMeetingModel.fromJson(Map<String, dynamic> json) => ZoomMeetingModel(
    id: json["id"],
    userId: json["user_id"],
    title: json["title"],
    description: json["description"],
    dateAndTime: json["date_and_time"],
    meetingId: json["meeting_id"],
    img: json["img"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    meetingPass: json["meeting_pass"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "title": title,
    "description": description,
    "date_and_time": dateAndTime,
    "meeting_id": meetingId,
    "img":  img,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "meeting_pass": meetingPass,
    "user":user.toJson(),
  };
}







