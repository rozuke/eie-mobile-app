// To parse this JSON data, do
//
//     final awsResponse = awsResponseFromMap(jsonString);

import 'dart:convert';

class Question {
    Question({
        required this.preguntaId,
        required this.enunciado,
        required this.orden,
        required this.libro,
        required this.tipoPregunta,
        this.adjuntos,
        this.etiquetas,
    });

    final int preguntaId;
    final String enunciado;
    final int orden;
    final Libro libro;
    final TipoPregunta tipoPregunta;
    final List<Adjunto>? adjuntos;
    final List<Etiqueta>? etiquetas;

    factory Question.fromJson(String str) => Question.fromMap(json.decode(str));


    factory Question.fromMap(Map<String, dynamic> json) => Question(
        preguntaId: json["preguntaId"],
        enunciado: json["enunciado"],
        orden: json["orden"],
        libro: Libro.fromMap(json["libro"]),
        tipoPregunta: TipoPregunta.fromMap(json["tipoPregunta"]),
        adjuntos: List<Adjunto>.from(json["adjuntos"].map((x) => Adjunto.fromMap(x))),
        etiquetas: List<Etiqueta>.from(json["etiquetas"].map((x) => Etiqueta.fromMap(x))),
    );

}

class Adjunto {
    Adjunto({
        required this.enlace,
        required this.respuestaCorrecta,
        required this.descripcion,
        required this.formato,
        required this.codigo,
    });

    final String enlace;
    final bool respuestaCorrecta;
    final String descripcion;
    final String formato;
    final String codigo;

    factory Adjunto.fromJson(String str) => Adjunto.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Adjunto.fromMap(Map<String, dynamic> json) => Adjunto(
        enlace: json["enlace"],
        respuestaCorrecta: json["respuestaCorrecta"],
        descripcion: json["descripcion"],
        formato: json["formato"],
        codigo: json["codigo"],
    );

    Map<String, dynamic> toMap() => {
        "enlace": enlace,
        "respuestaCorrecta": respuestaCorrecta,
        "descripcion": descripcion,
        "formato": formato,
        "codigo": codigo,
    };
}

class Etiqueta {
    Etiqueta({
        required this.nombre,
        required this.opcion,
        required this.secuencia,
        required this.tipoEtiquetaId,
    });

    final String nombre;
    final bool opcion;
    final int secuencia;
    final int tipoEtiquetaId;

    factory Etiqueta.fromJson(String str) => Etiqueta.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Etiqueta.fromMap(Map<String, dynamic> json) => Etiqueta(
        nombre: json["nombre"],
        opcion: json["opcion"],
        secuencia: json["secuencia"],
        tipoEtiquetaId: json["tipoEtiquetaId"],
    );

    Map<String, dynamic> toMap() => {
        "nombre": nombre,
        "opcion": opcion,
        "secuencia": secuencia,
        "tipoEtiquetaId": tipoEtiquetaId,
    };
}

class Libro {
    Libro({
        required this.libroId,
        required this.nombre,
        required this.nivel,
    });

    final int libroId;
    final String nombre;
    final String nivel;

    factory Libro.fromJson(String str) => Libro.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Libro.fromMap(Map<String, dynamic> json) => Libro(
        libroId: json["libroId"],
        nombre: json["nombre"],
        nivel: json["nivel"],
    );

    Map<String, dynamic> toMap() => {
        "libroId": libroId,
        "nombre": nombre,
        "nivel": nivel,
    };
}

class TipoPregunta {
    TipoPregunta({
        required this.tipo,
    });

    final String tipo;

    factory TipoPregunta.fromJson(String str) => TipoPregunta.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory TipoPregunta.fromMap(Map<String, dynamic> json) => TipoPregunta(
        tipo: json["tipo"],
    );

    Map<String, dynamic> toMap() => {
        "tipo": tipo,
    };
}
