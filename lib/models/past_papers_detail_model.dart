// To parse this JSON data, do
//
//     final pastPapersDetailModel = pastPapersDetailModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PastPapersDetailModel pastPapersDetailModelFromJson(String str) => PastPapersDetailModel.fromJson(json.decode(str));

String pastPapersDetailModelToJson(PastPapersDetailModel data) => json.encode(data.toJson());


class PastPapersDetailModel {
  PastPapersDetailModel({
    required this.id,
    required this.gradeId,
    required this.subjectId,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
    required this.grade,
    required this.subject,
    required this.medias,
  });

  int id;
  int gradeId;
  int subjectId;
  String title;
  String createdAt;
  String updatedAt;
  Grade grade;
  Grade subject;
  List<Media> medias;

  factory PastPapersDetailModel.fromJson(Map<String, dynamic> json) => PastPapersDetailModel(
    id: json["id"],
    gradeId: json["grade_id"],
    subjectId: json["subject_id"],
    title: json["title"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    grade: Grade.fromJson(json["grade"]),
    subject: Grade.fromJson(json["subject"]),
    medias: List<Media>.from(json["medias"].map((x) => Media.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "grade_id": gradeId,
    "subject_id": subjectId,
    "title": title,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "grade": grade.toJson(),
    "subject": subject.toJson(),
    "medias": List<dynamic>.from(medias.map((x) => x.toJson())),
  };
}

class Grade {
  Grade({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String createdAt;
  dynamic updatedAt;

  factory Grade.fromJson(Map<String, dynamic> json) => Grade(
    id: json["id"],
    name: json["name"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

class Media {
  Media({
    required this.id,
    required this.pastPaperId,
    required this.path,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int pastPaperId;
  String path;
  String name;
  String createdAt;
  String updatedAt;

  factory Media.fromJson(Map<String, dynamic> json) => Media(
    id: json["id"],
    pastPaperId: json["past_paper_id"],
    path: json["path"],
    name: json["name"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "past_paper_id": pastPaperId,
    "path": path,
    "name": name,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
