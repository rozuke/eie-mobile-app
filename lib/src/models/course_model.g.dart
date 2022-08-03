// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Course _$CourseFromJson(Map<String, dynamic> json) => Course(
      cursoId: json['cursoId'] as int,
      nombre: json['nombre'] as String,
      estado: json['estado'] as bool,
      libroId: json['libroId'] as int,
      libro: json['libro'] as String,
      nivel: json['nivel'] as String,
    );

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'cursoId': instance.cursoId,
      'nombre': instance.nombre,
      'estado': instance.estado,
      'libroId': instance.libroId,
      'libro': instance.libro,
      'nivel': instance.nivel,
    };
