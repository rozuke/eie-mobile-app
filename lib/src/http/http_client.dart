
import 'package:dio/dio.dart';

class HttpClient {

  final Dio _dio = Dio();

  final String _baseUserURL = "https://mwb03srtpc.execute-api.sa-east-1.amazonaws.com/api";
  final String _baseActivityURL = "https://kfaiqnrzja.execute-api.sa-east-1.amazonaws.com/api";

  HttpClient() {
    // initializeInterceptors();
  }
  Future<Response> getUserResquest(String url) async {
    Response response;
    try{
      response = await _dio.get("$_baseUserURL/$url");
      return response;
    }on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
  }

  Future<Response> getActivityRequest( String url ) async {
    Response response;
    try{
      response = await _dio.get("$_baseActivityURL/$url");
      return response;
    }on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
  }

  Future<Response> postActivityRequest( String url, Map<String, dynamic> body ) async {
    Response response;
    try{
      response = await _dio.post("$_baseActivityURL/$url", data: body);
      return response;
    }on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
  }

  Future<Response> putActivityRequest( String url ) async {
    Response response;
    try{
      response = await _dio.put("$_baseActivityURL/$url",);
      return response;
    }on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
  }

  initializeInterceptors(){
    _dio.interceptors.add(InterceptorsWrapper(
      onError: (e, _ ) => {
        print(e.message)
      },
      onRequest: (options, _ ) => {
        print(options.path)
      },
      onResponse: (response, _ ) => {
        print(response.data)
      },
    ));
  }

  

}