// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      usuarioId: json['usuarioId'] as int,
      email: json['email'] as String,
      estado: json['estado'] as bool,
      nombre: json['nombre'] as String,
      tipo: json['tipo'] as String,
      rolId: json['rolId'] as int,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'usuarioId': instance.usuarioId,
      'email': instance.email,
      'estado': instance.estado,
      'nombre': instance.nombre,
      'tipo': instance.tipo,
      'rolId': instance.rolId,
    };
