// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      resultadoId: json['resultadoId'] as int?,
      notaHomework: json['notaHomework'] as int?,
      notaEE: json['notaEE'] as int?,
      notaLaboratory: json['notaLaboratory'] as int?,
      usuarioId: json['usuarioId'] as int?,
      cantidadParticipacion: json['cantidadParticipacion'] as int?,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'resultadoId': instance.resultadoId,
      'notaHomework': instance.notaHomework,
      'notaEE': instance.notaEE,
      'notaLaboratory': instance.notaLaboratory,
      'cantidadParticipacion': instance.cantidadParticipacion,
      'usuarioId': instance.usuarioId,
    };
