
import 'package:eie_mobile_app/src/http/http_client.dart';
import 'package:eie_mobile_app/src/models/forum_model.dart';

class ActivityService {

  HttpClient _httpClient = HttpClient();


  Future<List<Forum>> getForumsTopic(int courseId) async {

    try {
      final response = await _httpClient.getActivityRequest("/course/$courseId/activities");

      // final parsedResonse = response.data as List<Forum>;
      
      final List<Forum> parsedResonse =  ( response.data as List ).map((i) => Forum.fromJson(i)).toList();
      return parsedResonse;
      
    } on Exception catch (e) {
      print(e);
      rethrow;
    }
  }
}