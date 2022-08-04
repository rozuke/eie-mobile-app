
import 'package:dio/dio.dart';
import 'package:eie_mobile_app/src/http/http_client.dart';
import 'package:eie_mobile_app/src/models/comment_model.dart';
import 'package:eie_mobile_app/src/models/comment_response_model.dart';
import 'package:eie_mobile_app/src/models/forum_model.dart';

class ActivityService {

  HttpClient _httpClient = HttpClient();


  Future<List<Forum>> getForumsTopic(int courseId) async {

    try {
      final response = await _httpClient.getActivityRequest("/course/$courseId/activities");
      final List<Forum> parsedResonse =  ( response.data as List ).map((i) => Forum.fromJson(i)).toList();
      return parsedResonse;
      
    } on Exception catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<CommentResponse> getComments(int courseId, int forumId) async {
    try{
      final response = await _httpClient.getActivityRequest("/course/$courseId/foro/$forumId/comments");
      final CommentResponse commentResponse = CommentResponse.fromJson(response.data);
      return commentResponse;
    }on Exception catch (e) {
      rethrow;
    }
  }

  Future<Response> postComment(int courseId, int forumId, Map<String, dynamic> data) async {
    try{
      final Response response = await _httpClient.postActivityRequest("/course/$courseId/forum/$forumId/comment",
      data);
      return response;
    }on Exception catch (e) {
      rethrow;
    }
  }
}