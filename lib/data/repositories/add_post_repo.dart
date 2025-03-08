import 'dart:io';
import 'package:blog_app/data/models/message_model.dart';
import 'package:blog_app/utils/utils.dart';
import 'package:dio/dio.dart';
import '../data_sources/remote_data/api_client.dart';
import '../data_sources/remote_data/api_endurls.dart';

class AddPostRepo extends ApiClient {
  AddPostRepo();

  Future<MessageModel> postaddpost(
      {required String title,
      required String slug,
      required int tagid,
      required int categoryid,
      required dynamic body,
      required int status,
      required int userid,
      required File featuredimage}) async {
    final gettoken = await Utils.gettoken();
    final String token = "Bearer $gettoken";

    Map<String, dynamic> postheaders = {"Authorization": token};
    final FormData formdata = FormData.fromMap({
      "title": title,
      "slug": slug,
      "tags": tagid,
      "categories": categoryid,
      "body": body,
      "status": status,
      "user_id": userid,
      "featuredimage": await MultipartFile.fromFile(featuredimage.path,
          filename: featuredimage.path.split('/').last),
    });
    try {


      var response = await postrequest(
          endurlPath: ApiEndurls.addpost,
          postheaders: postheaders,
          postbody: formdata);

      if (response.statusCode == 200) {

        MessageModel addpost = MessageModel.fromJson(response.data);
        return addpost;
      } else {

        return MessageModel();
      }
    } catch (e) {
    
      return MessageModel();
    }
  }
}
