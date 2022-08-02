
import 'package:dio/dio.dart';
import 'package:eie_mobile_app/src/http/http_client.dart';
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
}