// // To parse this JSON data, do
// //
// //     final profileData = profileDataFromJson(jsonString);
//
// import 'dart:convert';
//
// TeacherProfileDataModel profileDataFromJson(String str) => TeacherProfileDataModel.fromJson(json.decode(str));
//
// String profileDataToJson(TeacherProfileDataModel data) => json.encode(data.toJson());
//
//
//
// class TeacherProfileDataModel {
//   TeacherProfileDataModel({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.emailVerifiedAt,
//     required this.type,
//     required this.profileImg,
//     required this.phoneNumber,
//     this.city,
//     required this.country,
//     required this.gradeId,
//     required this.userOtp,
//     required this.institueName,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.followers,
//     required this.followings,
//     required this.studyMaterials,
//   });
//
//   int id;
//   String name;
//   String email;
//   DateTime emailVerifiedAt;
//   String type;
//   String profileImg;
//   String phoneNumber;
//   dynamic city;
//   String country;
//   dynamic gradeId;
//   String userOtp;
//   String institueName;
//   String createdAt;
//   DateTime updatedAt;
//   int followers;
//   int followings;
//   List<StudyMaterial> studyMaterials;
//
//   factory TeacherProfileDataModel.fromJson(Map<String, dynamic> json) => TeacherProfileDataModel(
//     id: json["id"],
//     name: json["name"],
//     email: json["email"],
//     emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
//     type: json["type"],
//     profileImg: json["profile_img"],
//     phoneNumber: json["phone_number"],
//     city: json["city"],
//     country: json["country"],
//     gradeId: json["grade_id"],
//     userOtp: json["user_otp"],
//     institueName: json["institue_name"],
//     createdAt: json["created_at"],
//     updatedAt: DateTime.parse(json["updated_at"]),
//     followers: json["user-follow"],
//     followings: json["user-following"],
//     studyMaterials: List<StudyMaterial>.from(json["study_materials"].map((x) => StudyMaterial.fromJson(x))),
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
//     "grade_id": gradeId,
//     "user_otp": userOtp,
//     "institue_name": institueName,
//     "created_at": createdAt,
//     "updated_at": updatedAt.toIso8601String(),
//     "user-follow": followers,
//     "user-following": followings,
//     "study_materials": List<dynamic>.from(studyMaterials.map((x) => x)),
//   };
// }
//
//
// class StudyMaterial {
//   StudyMaterial({
//     required this.id,
//     required this.userId,
//     required this.title,
//     required this.gradeId,
//     required this.subjectId,
//     required this.type,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.grade,
//     required this.subject,
//   });
//
//   int id;
//   int userId;
//   String title;
//   String gradeId;
//   String subjectId;
//   String type;
//   String createdAt;
//   String updatedAt;
//   Grade grade;
//   Grade subject;
//
//   factory StudyMaterial.fromJson(Map<String, dynamic> json) => StudyMaterial(
//     id: json["id"],
//     userId: json["user_id"],
//     title: json["title"],
//     gradeId: json["grade_id"],
//     subjectId: json["subject_id"],
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
//     "title": title,
//     "grade_id": gradeId,
//     "subject_id": subjectId,
//     "type": type,
//     "created_at": createdAt,
//     "updated_at": updatedAt,
//     "grade": grade.toJson(),
//     "subject": subject.toJson(),
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
//     updatedAt:  json["updated_at"],
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
//
//
//
