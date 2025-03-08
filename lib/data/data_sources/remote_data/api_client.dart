import 'package:blog_app/data/data_sources/remote_data/api_constants.dart';
import 'package:blog_app/data/data_sources/remote_data/api_exception.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiClient {
  late BaseOptions options;
  late Dio dio;

  ApiClient() {
    options = BaseOptions(
      baseUrl: ApiConstants.mainurl,
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 3),
    );
    dio = Dio(options);
  }

  //get request method
  Future<Response> getrequest(
      {required String endurlPath, Map<String, dynamic>? postheaders}) async {
    try {
      debugPrint("🚀==========Api Request Sent==========🚀");
      debugPrint("At url of ${options.baseUrl + endurlPath}");
      var response =
          await dio.get(endurlPath, options: Options(headers: postheaders));
      debugPrint("🔥==========Api Got Response==========🔥");
      debugPrint("status code :${response.statusCode}");
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        debugPrint(
            "😟==========Exception with response here is data, headers, requestoptions : ==========😟");

        throw ApiException(message: e.response!.statusCode);
      } else {
        debugPrint(
            "❌==========Exception with No response here is requestoptions, error-message : ==========❌");

        throw ApiException(message: e.message);
      }
    }
  }

  //post requests
  Future<Response> postrequest(
      {required String endurlPath,
      Map<String, dynamic>? postheaders,
      dynamic postbody}) async {
    try {
      debugPrint("🚀==========Api Request Sent==========🚀");
      debugPrint("At url of ${options.baseUrl + endurlPath}");
      var response = await dio.post(endurlPath,
          options: Options(headers: postheaders), data: postbody); 
      debugPrint("🔥==========Api Got Response==========🔥");
      debugPrint("status code :${response.statusCode}");
     
      return response;
    } on DioException catch (e) {
   
      if (e.response != null) {
        
        debugPrint(
            "😟==========Exception with response here is data, headers, requestoptions : ==========😟");
       
        throw ApiException(message: e.response!.statusCode);
      } else {
        //M
        debugPrint(
            "❌==========Exception with No response here is requestoptions, error-message : ==========❌");
        
        throw ApiException(message: e.message);
      }
    }
  }
}
