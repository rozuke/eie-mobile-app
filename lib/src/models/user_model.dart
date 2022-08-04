import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User {

  
  @JsonKey(name: 'usuarioId')
  final int usuarioId;

  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: "estado")
  final bool estado;

  @JsonKey(name: "nombre")
  final String nombre;

  @JsonKey(name: "tipo")
  final String tipo;

  @JsonKey(name: "rolId")
  final int rolId;

  User({required this.usuarioId, required this.email, required this.estado, required this.nombre, required this.tipo, required this.rolId});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserToJson(this);

}