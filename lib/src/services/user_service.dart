import 'package:eie_mobile_app/src/http/http_client.dart';
import 'package:eie_mobile_app/src/models/course_model.dart';
import 'package:eie_mobile_app/src/models/teacher_model.dart';
import 'package:eie_mobile_app/src/models/user_model.dart';

class UserService {

  final HttpClient _httpClient= HttpClient();


 
  Future<User> getUser(String email) async {
    try{
      final response = await _httpClient.getUserResquest("/user/student/$email");
      final parsedResponse = User.fromJson(response.data);
      return parsedResponse;
      // return parsedResponse;
    } on Exception catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<Course> getCourse(int userId) async {
    try{
      final response = await _httpClient.getUserResquest("/user/course/$userId");
      final parsedResponse = Course.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<Teacher> getTeacher(int courseId) async {
    try {
      final response = await _httpClient.getUserResquest("/user/teacher/course/$courseId");
      final parsedResponse = Teacher.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      rethrow;
    }
  }
}