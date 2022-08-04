import 'package:json_annotation/json_annotation.dart';

part 'result_model.g.dart';

@JsonSerializable()
class Result {

  @JsonKey(name: 'resultadoId')
  final int? resultadoId;

  @JsonKey(name: 'notaHomework')
  final int? notaHomework;

  @JsonKey(name: 'notaEE')
  final int? notaEE;

  @JsonKey(name: 'notaLaboratory')
  final int? notaLaboratory;

  @JsonKey(name: 'cantidadParticipacion')
  final int? cantidadParticipacion;

  @JsonKey(name: 'usuarioId')
  final int? usuarioId;

  Result({
    this.resultadoId,
    this.notaHomework,
    this.notaEE,
    this.notaLaboratory,
    this.usuarioId,
    this.cantidadParticipacion,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ResultToJson(this);
}