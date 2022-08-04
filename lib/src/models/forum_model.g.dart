// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forum_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Forum _$ForumFromJson(Map<String, dynamic> json) => Forum(
      actividadId: json['actividadId'] as int,
      topico: json['topico'] as String,
      descripcion: json['descripcion'] as String,
      tipo: json['tipo'] as String,
      fecha: json['fecha'] as String,
    );

Map<String, dynamic> _$ForumToJson(Forum instance) => <String, dynamic>{
      'actividadId': instance.actividadId,
      'topico': instance.topico,
      'descripcion': instance.descripcion,
      'tipo': instance.tipo,
      'fecha': instance.fecha,
    };
