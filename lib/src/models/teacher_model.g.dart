// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Teacher _$TeacherFromJson(Map<String, dynamic> json) => Teacher(
      teacherId: json['teacherId'] as int,
      nombreProfesor: json['nombreProfesor'] as String,
      emailProfesor: json['emailProfesor'] as String,
    );

Map<String, dynamic> _$TeacherToJson(Teacher instance) => <String, dynamic>{
      'teacherId': instance.teacherId,
      'nombreProfesor': instance.nombreProfesor,
      'emailProfesor': instance.emailProfesor,
    };
