import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'participation_model.g.dart';

@JsonSerializable()
class Participation {

  @JsonKey(name: 'participacionId')
  final int participacionId;

  @JsonKey(name: 'puntuacion')
  final int puntuacion;

  @JsonKey(name: 'usuarioId')
  final int usuarioId;

  @JsonKey(name: 'preguntaId')
  final int preguntaId;

  @JsonKey(name: 'valoracionId')
  final int valoracionId;

  Participation({
    required this.participacionId,
    required this.puntuacion,
    required this.usuarioId,
    required this.preguntaId,
    required this.valoracionId,
  });


  factory Participation.fromJson(Map<String, dynamic> json) => _$ParticipationFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ParticipationToJson(this);

}
