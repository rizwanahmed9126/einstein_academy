// To parse this JSON data, do
//
//     final pastPapersModel = pastPapersModelFromJson(jsonString);

import 'dart:convert';

PastPapersModel pastPapersModelFromJson(String str) => PastPapersModel.fromJson(json.decode(str));

String pastPapersModelToJson(PastPapersModel data) => json.encode(data.toJson());



class PastPapersModel {
  PastPapersModel({
    required this.id,
    required this.gradeId,
    required this.subjectId,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int gradeId;
  int subjectId;
  String title;
  String createdAt;
  String updatedAt;

  factory PastPapersModel.fromJson(Map<String, dynamic> json) => PastPapersModel(
    id: json["id"],
    gradeId: json["grade_id"],
    subjectId: json["subject_id"],
    title: json["title"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "grade_id": gradeId,
    "subject_id": subjectId,
    "title": title,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
