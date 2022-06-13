import 'package:json_annotation/json_annotation.dart';

part 'grade.g.dart';

@JsonSerializable()
class GradeModel {
  int? id;
  String? name;

  GradeModel(
    this.id,
    this.name,
  );

  factory GradeModel.fromJson(Map<String, dynamic> json) =>
      _$GradeModelFromJson(json);
  Map<String, dynamic> toJson() => _$GradeModelToJson(this);
}
