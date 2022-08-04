// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'participation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Participation _$ParticipationFromJson(Map<String, dynamic> json) =>
    Participation(
      participacionId: json['participacionId'] as int,
      puntuacion: json['puntuacion'] as int,
      usuarioId: json['usuarioId'] as int,
      preguntaId: json['preguntaId'] as int,
      valoracionId: json['valoracionId'] as int,
    );

Map<String, dynamic> _$ParticipationToJson(Participation instance) =>
    <String, dynamic>{
      'participacionId': instance.participacionId,
      'puntuacion': instance.puntuacion,
      'usuarioId': instance.usuarioId,
      'preguntaId': instance.preguntaId,
      'valoracionId': instance.valoracionId,
    };
