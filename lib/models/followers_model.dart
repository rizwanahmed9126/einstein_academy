// To parse this JSON data, do
//
//     final followersModel = followersModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';


FollowersModel studentProfileDataModelFromJson(String str) => FollowersModel.fromJson(json.decode(str));

String studentProfileDataModelToJson(FollowersModel data) => json.encode(data.toJson());


class FollowersModel {
  FollowersModel({
    required this.id,
    required this.followers,
  });

  int id;
  List<Follower> followers;

  factory FollowersModel.fromJson(Map<String, dynamic> json) => FollowersModel(
    id: json["id"],
    followers: List<Follower>.from(json["followers"].map((x) => Follower.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "followers": List<dynamic>.from(followers.map((x) => x.toJson())),
  };
}

class Follower {
  Follower({
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
  DateTime emailVerifiedAt;
  String type;
  String profileImg;
  String phoneNumber;
  dynamic city;
  String country;
  dynamic gradeId;
  String userOtp;
  String institueName;
  String createdAt;
  DateTime updatedAt;
  Pivot pivot;

  factory Follower.fromJson(Map<String, dynamic> json) => Follower(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
    type: json["type"],
    profileImg: json["profile_img"],
    phoneNumber: json["phone_number"],
    city: json["city"],
    country: json["country"],
    gradeId: json["grade_id"],
    userOtp: json["user_otp"],
    institueName: json["institue_name"],
    createdAt: json["created_at"],
    updatedAt: DateTime.parse(json["updated_at"]),
    pivot: Pivot.fromJson(json["pivot"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "email_verified_at": emailVerifiedAt.toIso8601String(),
    "type": type,
    "profile_img": profileImg,
    "phone_number": phoneNumber,
    "city": city,
    "country": country,
    "grade_id": gradeId,
    "user_otp": userOtp,
    "institue_name": institueName,
    "created_at": createdAt,
    "updated_at": updatedAt.toIso8601String(),
    "pivot": pivot.toJson(),
  };
}

class Pivot {
  Pivot({
    required this.userId,
    required this.followerId,
  });

  int userId;
  int followerId;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
    userId: json["user_id"],
    followerId: json["follower_id"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "follower_id": followerId,
  };
}
