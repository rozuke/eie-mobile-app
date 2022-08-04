// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      usuarioId: json['usuarioId'] as int,
      contenido: json['contenido'] as String,
      email: json['email'] as String,
      nombre: json['nombre'] as String,
    );

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'usuarioId': instance.usuarioId,
      'contenido': instance.contenido,
      'email': instance.email,
      'nombre': instance.nombre,
    };
