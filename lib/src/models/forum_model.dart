import 'package:json_annotation/json_annotation.dart';

part 'forum_model.g.dart';

@JsonSerializable()
class Forum {
  @JsonKey(name: 'actividadId')
  final int actividadId;

  @JsonKey(name: 'topico')
  final String topico;

  @JsonKey(name: 'descripcion')
  final String descripcion;

  @JsonKey(name: 'tipo')
  final String tipo;

  @JsonKey(name: 'fecha')
  final String fecha;

  Forum({
    required this.actividadId,
    required this.topico,
    required this.descripcion,
    required this.tipo,
    required this.fecha,
  });

  factory Forum.fromJson(Map<String, dynamic> json) => _$ForumFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ForumToJson(this);
}