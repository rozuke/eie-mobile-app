import 'package:json_annotation/json_annotation.dart';

part 'teacher_model.g.dart';

@JsonSerializable()
class Teacher {
  @JsonKey(name: 'teacherId')
  final int teacherId;

  @JsonKey(name: 'nombreProfesor')
  final String nombreProfesor;

  @JsonKey(name: 'emailProfesor')
  final String emailProfesor;

  Teacher({
    required this.teacherId,
    required this.nombreProfesor,
    required this.emailProfesor,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) => _$TeacherFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$TeacherToJson(this);

}