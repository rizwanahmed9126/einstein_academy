// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'dart:convert';

User userDataFromJson(String str) => User.fromJson(json.decode(str));

String userDataToJson(User data) => json.encode(data.toJson());

// class UserData {
//   UserData({
//     this.status,
//     this.message,
//     this.data,
//     this.code,
//   });
//
//   String? status;
//   String? message;
//   Data? data;
//   int? code;
//
//   factory UserData.fromJson(Map<String, dynamic> json) => UserData(
//         status: json["status"],
//         message: json["message"],
//         data: Data.fromJson(json["data"]),
//         code: json["code"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "message": message,
//         "data": data!.toJson(),
//         "code": code,
//       };
// }

// class Data {
//   Data({
//     this.token,
//     this.user,
//   });
//
//   String? token;
//   User? user;
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         token: json["token"],
//         user: User.fromJson(json["user"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "token": token,
//         "user": user!.toJson(),
//       };
// }

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.type,
    this.profileImg,
    this.phoneNumber,
    this.city,
    this.country,
    this.gradeId,
    this.userOtp,
    this.institueName,
    this.createdAt,
    this.updatedAt,
    this.grade,
    this.subjects,
  });

  int? id;
  String? name;
  String? email;
  DateTime? emailVerifiedAt;
  String? type;
  String? profileImg;
  String? phoneNumber;
  String? city;
  String? country;
  String? gradeId;
  String? userOtp;
  String? institueName;
  String? createdAt;
  DateTime? updatedAt;
  Grade? grade;
  List<Subject>? subjects;

  factory User.fromJson(Map<String, dynamic> json) => User(
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
        grade: json["grade"] == null
            ? Grade.fromJson({
                "id": 0,
                "name": 'dummy',
                "created_at": DateTime.now().toString(),
                "updated_at": DateTime.now().toString(),
              })
            : Grade.fromJson(json["grade"]),

        subjects: List<Subject>.from(json["subjects"].map((x) => Subject.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt!.toIso8601String(),
        "type": type,
        "profile_img": profileImg,
        "phone_number": phoneNumber,
        "city": city,
        "country": country,
        "grade_id": gradeId,
        "user_otp": userOtp,
        "institue_name": institueName,
        "created_at": createdAt,
        "updated_at": updatedAt!.toIso8601String(),
        "grade": grade!.toJson(),
        "subjects": List<dynamic>.from(subjects!.map((x) => x.toJson())),
      };
}

class Grade {
  Grade({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Grade.fromJson(Map<String, dynamic> json) => Grade(
        id: json["id"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}



class Subject {
  Subject({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
  });

  int id;
  String name;
  String createdAt;
  String updatedAt;
  Pivot pivot;

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
    id: json["id"],
    name: json["name"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    pivot: Pivot.fromJson(json["pivot"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "pivot": pivot.toJson(),
  };
}

class Pivot {
  Pivot({
    required this.userId,
    required this.subjectId,
  });

  int userId;
  int subjectId;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
    userId: json["user_id"],
    subjectId: json["subject_id"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "subject_id": subjectId,
  };
}




class MessageUser {
  String? username;
  int? userId;

  String? userMobile;
  String? profileImage;
  MessageUser({this.username, this.userId, this.userMobile, this.profileImage});
}

final currentUser = MessageUser(
    username: "Me",
    userMobile: '1119853265',
    userId: 9,
    profileImage:
        "https://cdn.pixabay.com/photo/2020/01/27/10/28/appetite-4796886__340.jpg");

final userList = <MessageUser>[
  MessageUser(
      profileImage:
          "https://cdn.pixabay.com/photo/2020/01/27/19/04/macbook-4798095__340.jpg",
      userId: 1,
      userMobile: '9876541230',
      username: 'Macron'),
  MessageUser(
      profileImage:
          "https://cdn.pixabay.com/photo/2020/01/28/07/17/lamp-4799089__340.jpg",
      userId: 2,
      userMobile: '1234567890',
      username: 'Lita'),
  MessageUser(
      profileImage:
          "https://cdn.pixabay.com/photo/2015/07/27/20/16/book-863418_960_720.jpg",
      userId: 4,
      userMobile: '8965236985',
      username: 'Sareen'),
  MessageUser(
      profileImage:
          "https://cdn.pixabay.com/photo/2018/01/15/07/51/woman-3083383__340.jpg",
      userId: 5,
      userMobile: '6669855478',
      username: 'Worsee'),
  MessageUser(
      profileImage:
          "https://cdn.pixabay.com/photo/2017/03/04/12/15/programming-2115930__340.jpg",
      userId: 6,
      userMobile: '9988998562',
      username: 'Provert'),
  MessageUser(
      profileImage:
          "https://cdn.pixabay.com/photo/2015/07/10/17/24/hipster-839803__340.jpg",
      userId: 7,
      userMobile: '5544236999',
      username: 'Hipster'),
];
