// To parse this JSON data, do
//
//     final teacherMaterialDetailModel = teacherMaterialDetailModelFromJson(jsonString);

import 'dart:convert';

TeacherMaterialDetailModel teacherMaterialDetailModelFromJson(String str) => TeacherMaterialDetailModel.fromJson(json.decode(str));

String teacherMaterialDetailModelToJson(TeacherMaterialDetailModel data) => json.encode(data.toJson());

// class TeacherMaterialDetailModel {
//   TeacherMaterialDetailModel({
//     this.status,
//     this.message,
//     this.data,
//     this.code,
//   });
//
//   String status;
//   String message;
//   Data data;
//   int code;
//
//   factory TeacherMaterialDetailModel.fromJson(Map<String, dynamic> json) => TeacherMaterialDetailModel(
//     status: json["status"],
//     message: json["message"],
//     data: Data.fromJson(json["data"]),
//     code: json["code"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "message": message,
//     "data": data.toJson(),
//     "code": code,
//   };
// }

class TeacherMaterialDetailModel {
  TeacherMaterialDetailModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.gradeId,
    required this.subjectId,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
    required this.grade,
    required this.isFollow,
    required this.subject,
    required this.medias,
    required this.user,
    required this.rating
  });

  dynamic id;
  int userId;
  String title;
  String gradeId;
  String subjectId;
  String type;
  String createdAt;
  String updatedAt;
  bool isFollow;
  Grade grade;
  Grade subject;
  List<Media> medias;
  User user;
  dynamic rating;

  factory TeacherMaterialDetailModel.fromJson(Map<String, dynamic> json) => TeacherMaterialDetailModel(
    id: json["id"],
    userId: json["user_id"],
    title: json["title"],
    gradeId: json["grade_id"],
    subjectId: json["subject_id"],
    type: json["type"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    isFollow: json["is_follow"],
    grade: Grade.fromJson(json["grade"]),
    subject: Grade.fromJson(json["subject"]),
    medias: List<Media>.from(json["medias"].map((x) => Media.fromJson(x))),
    user: User.fromJson(json["user"]),
    rating: json["rating"],
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
    "is_follow":isFollow,
    "grade": grade.toJson(),
    "subject": subject.toJson(),
    "medias": List<dynamic>.from(medias.map((x) => x.toJson())),
    "user": user.toJson(),
    "rating": rating,
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
    required this.studyMaterialId,
    this.name,
    required this.path,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int studyMaterialId;
  dynamic name;
  String path;
  String createdAt;
  String updatedAt;

  factory Media.fromJson(Map<String, dynamic> json) => Media(
    id: json["id"],
    studyMaterialId: json["study_material_id"],
    name: json["name"],
    path: json["path"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "study_material_id": studyMaterialId,
    "name": name,
    "path": path,
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
    this.profileImg,
    required this.phoneNumber,
    required this.city,
    required this.country,
    this.gradeId,
    required this.userOtp,
    this.institueName,
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
