//
//
// import 'dart:convert';
//
// StudentNotesDetailModel studentNotesDetailModelFromJson(String str) => StudentNotesDetailModel.fromJson(json.decode(str));
//
// String studentNotesDetailModelToJson(StudentNotesDetailModel data) => json.encode(data.toJson());
//
//
//
// class StudentNotesDetailModel {
//   StudentNotesDetailModel({
//     required this.id,
//     required this.userId,
//     required this.subjectId,
//     required this.gradeId,
//     required this.title,
//     required this.type,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.rating,
//     required this.user,
//     required this.grade,
//     required this.subject,
//     required this.medias,
//     required this.isFollow
//   });
//
//   int id;
//   int userId;
//   int subjectId;
//   int gradeId;
//   String title;
//   String type;
//   String createdAt;
//   String updatedAt;
//   dynamic rating;
//   User user;
//   Grade grade;
//   Grade subject;
//   List<Media> medias;
//   bool isFollow;
//
//   factory StudentNotesDetailModel.fromJson(Map<String, dynamic> json) => StudentNotesDetailModel(
//     id: json["id"],
//     userId: json["user_id"],
//     subjectId: json["subject_id"],
//     gradeId: json["grade_id"],
//     title: json["title"],
//     type: json["type"],
//     createdAt: json["created_at"],
//     updatedAt: json["updated_at"],
//     rating: json["rating"],
//     user: User.fromJson(json["user"]),
//     grade: Grade.fromJson(json["grade"]),
//     subject: Grade.fromJson(json["subject"]),
//     medias: List<Media>.from(json["medias"].map((x) => Media.fromJson(x))),
//     isFollow: json["is_follow"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "user_id": userId,
//     "subject_id": subjectId,
//     "grade_id": gradeId,
//     "title": title,
//     "type": type,
//     "created_at": createdAt,
//     "updated_at": updatedAt,
//     "rating": rating,
//     "user": user.toJson(),
//     "grade": grade.toJson(),
//     "subject": subject.toJson(),
//     "medias": List<dynamic>.from(medias.map((x) => x.toJson())),
//     "is_follow":isFollow,
//   };
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
//   String createdAt;
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
// class Media {
//   Media({
//     required this.id,
//     required this.studyNotesId,
//     this.name,
//     required this.path,
//     required this.createdAt,
//     required this.updatedAt,
//   });
//
//   int id;
//   int studyNotesId;
//   dynamic name;
//   String path;
//   String createdAt;
//   String updatedAt;
//
//   factory Media.fromJson(Map<String, dynamic> json) => Media(
//     id: json["id"],
//     studyNotesId: json["study_notes_id"],
//     name: json["name"],
//     path: json["path"],
//     createdAt: json["created_at"],
//     updatedAt: json["updated_at"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "study_notes_id": studyNotesId,
//     "name": name,
//     "path": path,
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
//     required this.emailVerifiedAt,
//     required this.type,
//     this.profileImg,
//     required this.phoneNumber,
//     required this.city,
//     required this.country,
//     required this.gradeId,
//     required this.userOtp,
//     this.institueName,
//     required this.createdAt,
//     required this.updatedAt,
//   });
//
//   int id;
//   String name;
//   String email;
//   String emailVerifiedAt;
//   String type;
//   dynamic profileImg;
//   String phoneNumber;
//   dynamic city;
//   String country;
//   dynamic gradeId;
//   String userOtp;
//   dynamic institueName;
//   String createdAt;
//   String updatedAt;
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
//     gradeId: json["grade_id"],
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
//     "email_verified_at": emailVerifiedAt,
//     "type": type,
//     "profile_img": profileImg,
//     "phone_number": phoneNumber,
//     "city": city,
//     "country": country,
//     "grade_id": gradeId,
//     "user_otp": userOtp,
//     "institue_name": institueName,
//     "created_at": createdAt,
//     "updated_at": updatedAt,
//   };
// }


// To parse this JSON data, do
//
//     final studentNotesDetailModel = studentNotesDetailModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';



StudentNotesDetailModel studentNotesDetailModelFromJson(String str) => StudentNotesDetailModel.fromJson(json.decode(str));

String studentNotesDetailModelToJson(StudentNotesDetailModel data) => json.encode(data.toJson());



class StudentNotesDetailModel {
  StudentNotesDetailModel({
    required this.id,
    required this.userId,
    required this.subjectId,
    required this.gradeId,
    required this.syllabusId,
    required this.title,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
    required this.rating,
    required this.isFollow,
    required this.user,
    required this.grade,
    required this.subject,
    required this.medias,
    required this.syllabus,
  });

  int id;
  int userId;
  int subjectId;
  int gradeId;
  dynamic syllabusId;
  String title;
  String type;
  String createdAt;
  String updatedAt;
  dynamic rating;
  bool isFollow;
  User user;
  Grade grade;
  Grade subject;
  List<Media> medias;
  Map<String, dynamic> syllabus;

  factory StudentNotesDetailModel.fromJson(Map<String, dynamic> json) => StudentNotesDetailModel(
    id: json["id"],
    userId: json["user_id"],
    subjectId: json["subject_id"],
    gradeId: json["grade_id"],
    syllabusId: json["syllabus_id"],
    title: json["title"],
    type: json["type"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    rating: json["rating"],
    isFollow: json["is_follow"],
    user: User.fromJson(json["user"]),
    grade: Grade.fromJson(json["grade"]),
    subject: Grade.fromJson(json["subject"]),
    medias: List<Media>.from(json["medias"].map((x) => Media.fromJson(x))),
    syllabus: json["syllabus"], //Grade.fromJson(json["syllabus"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "subject_id": subjectId,
    "grade_id": gradeId,
    "syllabus_id": syllabusId,
    "title": title,
    "type": type,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "rating": rating,
    "is_follow": isFollow,
    "user": user.toJson(),
    "grade": grade.toJson(),
    "subject": subject.toJson(),
    "medias": List<dynamic>.from(medias.map((x) => x.toJson())),
    "syllabus": syllabus,
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
    required this.studyNotesId,
    this.name,
    required this.path,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int studyNotesId;
  dynamic name;
  String path;
  String createdAt;
  String updatedAt;

  factory Media.fromJson(Map<String, dynamic> json) => Media(
    id: json["id"],
    studyNotesId: json["study_notes_id"],
    name: json["name"],
    path: json["path"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "study_notes_id": studyNotesId,
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
    required this.gradeId,
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


