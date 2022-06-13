// import 'package:json_annotation/json_annotation.dart';
//
// part 'subject.g.dart';
//
// @JsonSerializable()
// class SubjectModel {
//   int id;
//   String name;
//   String createdAt;
//   String updatedAt;
//   SubjectModel(
//       this.id,
//       this.name,
//       this.createdAt,
//       this.updatedAt);
//
//
//
//   factory SubjectModel.fromJson(Map<String, dynamic> json) =>
//       _$SubjectModelFromJson(json);
//   Map<String, dynamic> toJson() => _$SubjectModelToJson(this);
// }




class SubjectModel {
  SubjectModel({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  dynamic createdAt;
  dynamic updatedAt;

  factory SubjectModel.fromJson(Map<String, dynamic> json) => SubjectModel(
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

