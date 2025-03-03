import 'package:blog_app/data/data_sources/remote_data/api_client.dart';
import 'package:blog_app/data/data_sources/remote_data/api_endurls.dart';
import 'package:blog_app/presentation/screens/general/tags/tags_model.dart';
import 'package:flutter/material.dart';

class TagsRepo extends ApiClient {
  TagsRepo();
  Future<TagModel> getalltags() async {
    var response = await getrequest(endurlPath: ApiEndurls.tags);
    try {
      if (response.statusCode == 200) {
        TagModel tagmodel = TagModel.fromjson(response.data);
        return tagmodel;
      } else {
        return TagModel();
      }
    } catch (e) {
      debugPrint("=========❌tags_repo exception : ${e.toString()}❌===========");
      return TagModel();
    }
  }
}
