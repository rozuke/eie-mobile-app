import 'package:eie_mobile_app/src/models/comment_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'forum_model.dart';

part 'comment_response_model.g.dart';

@JsonSerializable()
class CommentResponse {

  @JsonKey(name: 'foro')
  final Forum foro;

  @JsonKey(name: 'comentarios')
  final List<Comment> comentarios;

  CommentResponse({
    required this.foro,
    required this.comentarios,
  });

  factory CommentResponse.fromJson(Map<String, dynamic> json) => _$CommentResponseFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CommentResponseToJson(this);
}