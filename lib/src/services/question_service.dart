import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:eie_mobile_app/src/models/question_model.dart';
import 'package:http/http.dart' as http;
class QuestionService {
  final Dio _dio = Dio();

  String baseURL = 'https://kfaiqnrzja.execute-api.sa-east-1.amazonaws.com/api/preguntas';
 
 
// Future<List<Question>>
   getQuestions() async{
    // var url = Uri.parse(baseURL);
    // var response = await http.get(url);
    // final decode = Question.fromJson(response.body);
    // print(decode);
    try{
      Response response = await _dio.get(baseURL);
      final questions = response.data;
      
      // return List<Question>.from(
      //   (questions).map((x) => Question.fromJson(x))
      // );

      
    } on DioError catch (e) {
      print(e);
      rethrow;
    }
    
    
  }
}