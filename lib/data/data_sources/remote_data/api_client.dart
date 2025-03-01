import 'package:blog_app/data/data_sources/remote_data/api_constants.dart';
import 'package:blog_app/data/data_sources/remote_data/api_endurls.dart';
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
  Future<Response> getrequest({required String endurlPath}) async {
    try {
      debugPrint("🚀==========Api Request Sent==========🚀");
      debugPrint("At url of ${options.baseUrl + endurlPath}");
      var response = await dio.get(endurlPath); //M
      debugPrint("🔥==========Api Got Response==========🔥");
      debugPrint("status code :${response.statusCode}");
      debugPrint("✅Here is the data : ${response.data} ✅ ");
      return response;
    } on DioException catch (e) {
      //M
      if (e.response != null) {
        //M
        debugPrint(
            "😟==========Exception with response here is data, headers, requestoptions : ==========😟");
        debugPrint(e.response!.data);
        debugPrint(e.response!.headers.toString());
        debugPrint(e.response!.requestOptions.toString());
        throw ApiException(message: e.response!.statusCode);
      } else {
        //M
        debugPrint(
            "❌==========Exception with No response here is requestoptions, error-message : ==========❌");
        debugPrint(e.requestOptions.toString());
        debugPrint(e.message);
        throw ApiException(message: e.message);
      }
    }
  }

  //post requests
  Future<Response> postrequest({required String endurlPath}) async {
    dynamic postbody = {"title": "post title", "slug": "empty-slug"};

    Map<String, dynamic> postheaders = {
      "Authorization": "Bearer 2521|6kinrH1khq59zy5UxialyeLXdyL0HnIFUa9kMuu5"
    };

    try {
      debugPrint("🚀==========Api Request Sent==========🚀");
      debugPrint("At url of ${options.baseUrl + endurlPath}");
      var response = await dio.post(endurlPath,
          options: Options(headers: postheaders), data: postbody); //M
      debugPrint("🔥==========Api Got Response==========🔥");
      debugPrint("status code :${response.statusCode}");
      debugPrint("✅Here is the data : ${response.data} ✅ ");
      return response;
    } on DioException catch (e) {
      //M
      if (e.response != null) {
        //M
        debugPrint(
            "😟==========Exception with response here is data, headers, requestoptions : ==========😟");
        debugPrint(e.response!.data);
        debugPrint(e.response!.headers.toString());
        debugPrint(e.response!.requestOptions.toString());
        throw ApiException(message: e.response!.statusCode);
      } else {
        //M
        debugPrint(
            "❌==========Exception with No response here is requestoptions, error-message : ==========❌");
        debugPrint(e.requestOptions.toString());
        debugPrint(e.message);
        throw ApiException(message: e.message);
      }
    }
  }
}
