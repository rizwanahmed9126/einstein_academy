// // To parse this JSON data, do
// //
// //     final studyMaterialModel = studyMaterialModelFromJson(jsonString);
//
//
// import 'package:json_annotation/json_annotation.dart';
//
// part 'teacher_material_model.g.dart';
//
// @JsonSerializable()
//
//
// class TeacherMaterialModel {
//   TeacherMaterialModel({
//     required this.id,
//     required this.userId,
//     required this.title,
//     required this.gradeId,
//     required this.subjectId,
//     required this.type,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.user,
//     required this.grade,
//     required this.subject,
//     //required this.medias,
//   });
//
//   int id;
//   int userId;
//   String title;
//   String gradeId;
//   String subjectId;
//   String type;
//   dynamic createdAt;
//   dynamic updatedAt;
//   User user;
//   Grade grade;
//   Grade subject;
//   //List<Media> medias;
//
//   factory TeacherMaterialModel.fromJson(Map<String, dynamic> json) => _$TeacherMaterialModelFromJson(json);
//   Map<String, dynamic> toJson() => _$TeacherMaterialModelToJson(this);
//
// }
//
// class Grade {
//   Grade({
//     required this.id,
//     required this.name,
//     required this.createdAt,
//     required this.updatedAt,
//   });
//
//   int id;
//   String name;
//   dynamic createdAt;
//   dynamic updatedAt;
//
//   factory Grade.fromJson(Map<String, dynamic> json) => Grade(
//     id: json["id"],
//     name: json["name"],
//     createdAt: json["created_at"],
//     updatedAt: json["updated_at"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "created_at": createdAt,
//     "updated_at": updatedAt,
//   };
// }
//
// class User {
//   User({
//     required this.id,
//     required this.name,
//     required this.email,
//     this.emailVerifiedAt,
//     required this.type,
//     this.profileImg,
//     required this.phoneNumber,
//     required this.city,
//     required this.country,
//     required this.gradeId,
//     required this.userOtp,
//     this.institueName,
//     required this.createdAt,
//     this.updatedAt,
//   });
//
//   int id;
//   String name;
//   String email;
//   dynamic emailVerifiedAt;
//   String type;
//   dynamic profileImg;
//   String phoneNumber;
//   dynamic city;
//   String country;
//   dynamic gradeId;
//   String userOtp;
//   dynamic institueName;
//   String createdAt;
//   dynamic updatedAt;
//
//   factory User.fromJson(Map<String, dynamic> json) => User(
//     id: json["id"],
//     name: json["name"],
//     email: json["email"],
//     emailVerifiedAt: json["email_verified_at"],
//     type: json["type"],
//     profileImg: json["profile_img"],
//     phoneNumber: json["phone_number"],
//     city: json["city"],
//     country: json["country"],
//     gradeId: json["grade_id"] == null ? null : json["grade_id"],
//     userOtp: json["user_otp"],
//     institueName: json["institue_name"],
//     createdAt: json["created_at"],
//     updatedAt: json["updated_at"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "email": email,
//     "email_verified_at": emailVerifiedAt.toIso8601String(),
//     "type": type,
//     "profile_img": profileImg,
//     "phone_number": phoneNumber,
//     "city": city,
//     "country": country,
//     "grade_id": gradeId == null ? null : gradeId,
//     "user_otp": userOtp,
//     "institue_name": institueName,
//     "created_at": createdAt,
//     "updated_at": updatedAt.toIso8601String(),
//   };
// }
//
//
//
//


// To parse this JSON data, do
//
//     final teacherMaterialModel = teacherMaterialModelFromJson(jsonString);

import 'dart:convert';

List<TeacherMaterialModel> teacherMaterialModelFromJson(String str) => List<TeacherMaterialModel>.from(json.decode(str).map((x) => TeacherMaterialModel.fromJson(x)));

String teacherMaterialModelToJson(List<TeacherMaterialModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TeacherMaterialModel {
  TeacherMaterialModel({
    required this.studymaterial,
    required this.user,
    required this.isFollow,
    this.rating
  });

  Studymaterial studymaterial;
  User user;
  bool isFollow;
  var rating;

  factory TeacherMaterialModel.fromJson(Map<String, dynamic> json) => TeacherMaterialModel(
    studymaterial: Studymaterial.fromJson(json["studymaterial"]),
    user: User.fromJson(json["user"]),
    isFollow: json["is_follow"],
    rating: json["rating"]
  );

  Map<String, dynamic> toJson() => {
    "studymaterial": studymaterial.toJson(),
    "user": user.toJson(),
    "is_follow": isFollow,
    "rating": rating,
  };
}











class Studymaterial {
  Studymaterial({
    required this.id,
    required this.userId,
    required this.title,
    required this.gradeId,
    required this.subjectId,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
    required this.grade,
    required this.subject,
  });

  int id;
  int userId;
  String title;
  String gradeId;
  String subjectId;
  String type;
  String createdAt;
  String updatedAt;
  Grade grade;
  Grade subject;

  factory Studymaterial.fromJson(Map<String, dynamic> json) => Studymaterial(
    id: json["id"],
    userId: json["user_id"],
    title: json["title"],
    gradeId: json["grade_id"],
    subjectId: json["subject_id"],
    type: json["type"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    grade: Grade.fromJson(json["grade"]),
    subject: Grade.fromJson(json["subject"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "title": title,
    "grade_id": gradeId,
    "subject_id": subjectId,
    "type": type,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "grade": grade.toJson(),
    "subject": subject.toJson(),
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

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.type,
    required this.profileImg,
    required this.phoneNumber,
    this.city,
    required this.country,
    this.gradeId,
    required this.userOtp,
    required this.institueName,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String email;
  String emailVerifiedAt;
  String type;
  dynamic profileImg;
  String phoneNumber;
  dynamic city;
  String country;
  dynamic gradeId;
  String userOtp;
  dynamic institueName;
  String createdAt;
  String updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    type: json["type"],
    profileImg: json["profile_img"],
    phoneNumber: json["phone_number"],
    city: json["city"],
    country: json["country"],
    gradeId: json["grade_id"],
    userOtp: json["user_otp"],
    institueName: json["institue_name"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "type": type,
    "profile_img": profileImg,
    "phone_number": phoneNumber,
    "city": city,
    "country": country,
    "grade_id": gradeId,
    "user_otp": userOtp,
    "institue_name": institueName,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

