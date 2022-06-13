// To parse this JSON data, do
//
//     final followingModel = followingModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';


FollowingModel studentProfileDataModelFromJson(String str) => FollowingModel.fromJson(json.decode(str));

String studentProfileDataModelToJson(FollowingModel data) => json.encode(data.toJson());

class FollowingModel {
  FollowingModel({
    required this.id,
    required this.followings,
  });

  int id;
  List<Following> followings;

  factory FollowingModel.fromJson(Map<String, dynamic> json) => FollowingModel(
    id: json["id"],
    followings: List<Following>.from(json["followings"].map((x) => Following.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "followings": List<dynamic>.from(followings.map((x) => x.toJson())),
  };
}

class Following {
  Following({
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
    required this.pivot,
  });

  int id;
  String name;
  String email;
  String emailVerifiedAt;
  String type;
  String profileImg;
  String phoneNumber;
  dynamic city;
  String country;
  dynamic gradeId;
  String userOtp;
  String institueName;
  String createdAt;
  String updatedAt;
  Pivot pivot;

  factory Following.fromJson(Map<String, dynamic> json) => Following(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    type: json["type"],
    profileImg: json["profile_img"],
    phoneNumber: json["phone_number"],
    city: json["city"],
    country: json["country"],
    gradeId: json["grade_id"] == null ? null : json["grade_id"],
    userOtp: json["user_otp"],
    institueName: json["institue_name"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    pivot: Pivot.fromJson(json["pivot"]),
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
    "grade_id": gradeId == null ? null : gradeId,
    "user_otp": userOtp,
    "institue_name": institueName,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "pivot": pivot.toJson(),
  };
}

class Pivot {
  Pivot({
    required this.followerId,
    required this.userId,
  });

  int followerId;
  int userId;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
    followerId: json["follower_id"],
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "follower_id": followerId,
    "user_id": userId,
  };
}
