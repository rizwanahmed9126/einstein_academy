// To parse this JSON data, do
//
//     final studentProfileDataModel = studentProfileDataModelFromJson(jsonString);

import 'dart:convert';

ProfileDataModel studentProfileDataModelFromJson(String str) => ProfileDataModel.fromJson(json.decode(str));

String studentProfileDataModelToJson(ProfileDataModel data) => json.encode(data.toJson());


class ProfileDataModel {
  ProfileDataModel({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.type,
    required this.profileImg,
    required this.phoneNumber,
    this.city,
    required this.country,
    required this.gradeId,
    required this.userOtp,
    required this.institueName,
    required this.createdAt,
    required this.updatedAt,
    required this.userFollow,
    required this.userFollowing,
    required this.studyNotes,
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
  int userFollow;
  int userFollowing;
  List<StudyNote>? studyNotes;

  factory ProfileDataModel.fromJson(Map<String, dynamic> json) => ProfileDataModel(
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
    userFollow: json["user-follow"],
    userFollowing: json["user-following"],
    studyNotes: json["study_notes"] == null ? List<StudyNote>.from(json["study_materials"].map((x) => StudyNote.fromJson(x))) : List<StudyNote>.from(json["study_notes"].map((x) => StudyNote.fromJson(x))),
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
    "user-follow": userFollow,
    "user-following": userFollowing,
    "study_notes": studyNotes == null ? List<dynamic>.from(studyNotes!.map((x) => x.toJson())) : List<dynamic>.from(studyNotes!.map((x) => x.toJson())),
  };
}

class StudyNote {
  StudyNote({
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
  dynamic subjectId;
  dynamic gradeId;
  String title;
  String type;
  String createdAt;
  String updatedAt;
  Grade grade;
  Grade subject;

  factory StudyNote.fromJson(Map<String, dynamic> json) => StudyNote(
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




