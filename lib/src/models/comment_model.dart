import 'package:json_annotation/json_annotation.dart';

part 'comment_model.g.dart';

@JsonSerializable()
class Comment {
  @JsonKey(name: 'usuarioId')
  final int usuarioId;

  @JsonKey(name: 'contenido')
  final String contenido;

  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'nombre')
  final String nombre;

  Comment({
    required this.usuarioId,
    required this.contenido,
    required this.email,
    required this.nombre,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CommentToJson(this);

  Comment copy() => Comment(
        usuarioId: usuarioId,
        contenido: contenido,
        email: email,
        nombre: nombre,
      );
}