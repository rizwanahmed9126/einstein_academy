// // // To parse this JSON data, do
// // //
// // //     final studentNotesModel = studentNotesModelFromJson(jsonString);
// //
// // import 'dart:convert';
// //
// // StudentNotesModel studentNotesModelFromJson(String str) => StudentNotesModel.fromJson(json.decode(str));
// //
// // String studentNotesModelToJson(StudentNotesModel data) => json.encode(data.toJson());
// //
// //
// //
// // class StudentNotesModel {
// //   StudentNotesModel({
// //     required this.id,
// //     required this.userId,
// //     required this.subjectId,
// //     required this.gradeId,
// //     required this.title,
// //     required this.createdAt,
// //     required this.updatedAt,
// //     required this.user,
// //     required this.grade,
// //     required this.subject,
// //     //required this.medias,
// //     this.type
// //   });
// //
// //   int id;
// //   int userId;
// //   int subjectId;
// //   int gradeId;
// //   dynamic type;
// //   String title;
// //   String createdAt;
// //   String updatedAt;
// //   User user;
// //   Grade grade;
// //   Grade subject;
// //  // List<Media> medias;
// //
// //   factory StudentNotesModel.fromJson(Map<String, dynamic> json) => StudentNotesModel(
// //     id: json["id"],
// //     userId: json["user_id"],
// //     subjectId: json["subject_id"],
// //     type: json["type"],
// //     gradeId: json["grade_id"],
// //     title: json["title"],
// //     createdAt: json["created_at"],
// //     updatedAt: json["updated_at"],
// //     user: User.fromJson(json["user"]),
// //     grade: Grade.fromJson(json["grade"]),
// //     subject: Grade.fromJson(json["subject"]),
// //     //medias: List<Media>.from(json["medias"].map((x) => Media.fromJson(x))),
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "id": id,
// //     "user_id": userId,
// //     "subject_id": subjectId,
// //     "type":type,
// //     "grade_id": gradeId,
// //     "title": title,
// //     "created_at": createdAt,
// //     "updated_at": updatedAt,
// //     "user": user.toJson(),
// //     "grade": grade.toJson(),
// //     "subject": subject.toJson(),
// //     //"medias": List<dynamic>.from(medias.map((x) => x.toJson())),
// //   };
// // }
// //
// // class Grade {
// //   Grade({
// //     required this.id,
// //     required this.name,
// //     required this.createdAt,
// //     required this.updatedAt,
// //   });
// //
// //   int id;
// //   String name;
// //   String createdAt;
// //   String updatedAt;
// //
// //   factory Grade.fromJson(Map<String, dynamic> json) => Grade(
// //     id: json["id"],
// //     name: json["name"],
// //     createdAt: json["created_at"],
// //     updatedAt: json["updated_at"],
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "id": id,
// //     "name": name,
// //     "created_at": createdAt,
// //     "updated_at": updatedAt,
// //   };
// // }
// //
// // class Media {
// //   Media({
// //     required this.id,
// //     required this.studyNotesId,
// //     this.name,
// //     required this.path,
// //     required this.createdAt,
// //     required this.updatedAt,
// //   });
// //
// //   int id;
// //   int studyNotesId;
// //   dynamic name;
// //   String path;
// //   String createdAt;
// //   String updatedAt;
// //
// //   factory Media.fromJson(Map<String, dynamic> json) => Media(
// //     id: json["id"],
// //     studyNotesId: json["study_notes_id"],
// //     name: json["name"],
// //     path: json["path"],
// //     createdAt: json["created_at"],
// //     updatedAt: json["updated_at"],
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "id": id,
// //     "study_notes_id": studyNotesId,
// //     "name": name,
// //     "path": path,
// //     "created_at": createdAt,
// //     "updated_at": updatedAt,
// //   };
// // }
// //
// // class User {
// //   User({
// //     required this.id,
// //     required this.name,
// //     required this.email,
// //     required this.emailVerifiedAt,
// //     required this.type,
// //     this.profileImg,
// //     required this.phoneNumber,
// //     required this.city,
// //     required this.country,
// //     required this.gradeId,
// //     required this.userOtp,
// //     this.institueName,
// //     required this.createdAt,
// //     required this.updatedAt,
// //   });
// //
// //   int id;
// //   String name;
// //   String email;
// //   String emailVerifiedAt;
// //   String type;
// //   dynamic profileImg;
// //   String phoneNumber;
// //   dynamic city;
// //   String country;
// //   String gradeId;
// //   String userOtp;
// //   dynamic institueName;
// //   String createdAt;
// //   String updatedAt;
// //
// //   factory User.fromJson(Map<String, dynamic> json) => User(
// //     id: json["id"],
// //     name: json["name"],
// //     email: json["email"],
// //     emailVerifiedAt: json["email_verified_at"],
// //     type: json["type"] == null ? null : json["type"],
// //     profileImg: json["profile_img"],
// //     phoneNumber: json["phone_number"],
// //     city: json["city"],
// //     country: json["country"],
// //     gradeId: json["grade_id"] == null ? null : json["grade_id"],
// //     userOtp: json["user_otp"],
// //     institueName: json["institue_name"],
// //     createdAt: json["created_at"],
// //     updatedAt: json["updated_at"],
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "id": id,
// //     "name": name,
// //     "email": email,
// //     "email_verified_at": emailVerifiedAt,
// //     "type": type == null ? null : type,
// //     "profile_img": profileImg,
// //     "phone_number": phoneNumber,
// //     "city": city,
// //     "country": country,
// //     "grade_id": gradeId == null ? null : gradeId,
// //     "user_otp": userOtp,
// //     "institue_name": institueName,
// //     "created_at": createdAt,
// //     "updated_at": updatedAt,
// //   };
// // }
//
// // To parse this JSON data, do
// //
// //     final studentNotesModel = studentNotesModelFromJson(jsonString);
//
// import 'package:meta/meta.dart';
// import 'dart:convert';
//
// StudentNotesModel studentNotesModelFromJson(String str) => StudentNotesModel.fromJson(json.decode(str));
//
// String studentNotesModelToJson(StudentNotesModel data) => json.encode(data.toJson());
//
// class StudentNotesModel {
//   StudentNotesModel({
//     required this.studynotes,
//     required this.user,
//     required this.isFollow,
//   });
//
//   Studynotes studynotes;
//   User user;
//   bool isFollow;
//
//   factory StudentNotesModel.fromJson(Map<String, dynamic> json) => StudentNotesModel(
//     studynotes: Studynotes.fromJson(json["studynotes"]),
//     user: User.fromJson(json["user"]),
//     isFollow: json["is_follow"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "studynotes": studynotes.toJson(),
//     "user": user.toJson(),
//     "is_follow": isFollow,
//   };
// }
//
// class Studynotes {
//   Studynotes({
//     required this.id,
//     required this.userId,
//     required this.subjectId,
//     required this.gradeId,
//     required this.title,
//     required this.type,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.grade,
//     required this.subject,
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
//   Grade grade;
//   Grade subject;
//
//
//   factory Studynotes.fromJson(Map<String, dynamic> json) => Studynotes(
//     id: json["id"],
//     userId: json["user_id"],
//     subjectId: json["subject_id"],
//     gradeId: json["grade_id"],
//     title: json["title"],
//     type: json["type"],
//     createdAt: json["created_at"],
//     updatedAt: json["updated_at"],
//     grade: Grade.fromJson(json["grade"]),
//     subject: Grade.fromJson(json["subject"]),
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
//     "grade": grade.toJson(),
//     "subject": subject.toJson(),
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
//     required this.profileImg,
//     required this.phoneNumber,
//     required this.city,
//     required this.country,
//     required this.gradeId,
//     required this.userOtp,
//     required this.institueName,
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


// To parse this JSON data, do
//
//     final studentNotesModel = studentNotesModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

StudentNotesModel studentNotesModelFromJson(String str) => StudentNotesModel.fromJson(json.decode(str));

String studentNotesModelToJson(StudentNotesModel data) => json.encode(data.toJson());

class StudentNotesModel {
  StudentNotesModel({
    required this.studynotes,
    required this.user,
    required this.rating,
  });

  Studynotes studynotes;
  User user;
  var rating;

  factory StudentNotesModel.fromJson(Map<String, dynamic> json) => StudentNotesModel(
    studynotes: Studynotes.fromJson(json["studynotes"]),
    user: User.fromJson(json["user"]),
    rating: json["rating"],
  );

  Map<String, dynamic> toJson() => {
    "studynotes": studynotes.toJson(),
    "user": user.toJson(),
    "rating": rating,
  };
}

class Studynotes {
  Studynotes({
    required this.id,
    required this.userId,
    required this.subjectId,
    required this.gradeId,
    required this.title,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
    required this.grade,
    required this.subject,
  });

  int id;
  int userId;
  int subjectId;
  int gradeId;
  String title;
  String type;
  String createdAt;
  String updatedAt;
  Grade grade;
  Grade subject;


  factory Studynotes.fromJson(Map<String, dynamic> json) => Studynotes(
    id: json["id"],
    userId: json["user_id"],
    subjectId: json["subject_id"],
    gradeId: json["grade_id"],
    title: json["title"],
    type: json["type"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    grade: Grade.fromJson(json["grade"]),
    subject: Grade.fromJson(json["subject"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "subject_id": subjectId,
    "grade_id": gradeId,
    "title": title,
    "type": type,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "grade": grade.toJson(),
    "subject": subject.toJson(),
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
    required this.city,
    required this.country,
    required this.gradeId,
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
