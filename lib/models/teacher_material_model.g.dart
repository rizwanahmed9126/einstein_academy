// // GENERATED CODE - DO NOT MODIFY BY HAND
//
// part of 'teacher_material_model.dart';
//
// // **************************************************************************
// // JsonSerializableGenerator
// // **************************************************************************
//
// TeacherMaterialModel _$TeacherMaterialModelFromJson(Map<String, dynamic> json) => TeacherMaterialModel(
//     id: json["id"],
//     userId: json["user_id"],
//     title: json["title"],
//     gradeId: json["grade_id"],
//     subjectId: json["subject_id"],
//     type: json["type"] == null ? null : json["type"],
//     createdAt: DateTime.parse(json["created_at"]),
//     updatedAt: DateTime.parse(json["updated_at"]),
//     user: User.fromJson(json["user"]),
//     grade: Grade.fromJson(json["grade"]),
//     subject: Grade.fromJson(json["subject"]),
//     //medias: List<Media>.from(json["medias"].map((x) => Media.fromJson(x))),
// );
//
// Map<String, dynamic> _$TeacherMaterialModelToJson(TeacherMaterialModel instance) => <String, dynamic>{
//     "id": instance.id,
//     "user_id": instance.userId,
//     "title": instance.title,
//     "grade_id": instance.gradeId,
//     "subject_id": instance.subjectId,
//     "type": instance.type == null ? null : instance.type,
//     "created_at": instance.createdAt,
//     "updated_at": instance.updatedAt,
//     "user": instance.user.toJson(),
//     "grade": instance.grade.toJson(),
//     "subject": instance.subject.toJson(),
//     //"medias": List<dynamic>.from(instance.medias.map((x) => x.toJson())),
//     };
