import 'package:json_annotation/json_annotation.dart';

part 'course_model.g.dart';

@JsonSerializable()
class Course {

  
  @JsonKey(name: 'cursoId')
  final int cursoId;

  @JsonKey(name: 'nombre')
  final String nombre;

  @JsonKey(name: "estado")
  final bool estado;

  @JsonKey(name: "libroId")
  final int libroId;

  @JsonKey(name: "libro")
  final String libro;

  @JsonKey(name: "nivel")
  final String nivel;


  Course({
    required this.cursoId,
    required this.nombre,
    required this.estado,
    required this.libroId,
    required this.libro,
    required this.nivel,
  });

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CourseToJson(this);

}