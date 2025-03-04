import 'dart:developer';

import 'package:blog_app/presentation/screens/general/home/home_model.dart';
import 'package:flutter/material.dart';

import '../data_sources/remote_data/api_client.dart';
import '../data_sources/remote_data/api_endurls.dart';

class Postsrepo extends ApiClient {
  Postsrepo();
  Future<BlogResponse> getallposts() async {
    try {
      var response = await getrequest(endurlPath: ApiEndurls.posts);
      if (response.statusCode == 200) {
        BlogResponse blogResponse = BlogResponse.fromJson(response.data);
          //log("🟢 API Success! Received ${response.data['all_posts']?.length ?? 0} posts.");
    
        return blogResponse;
      } else {
         //log("🔴 API Error! Status: ${response.statusCode}, Response: ${response.data}");
        return BlogResponse();
      }
    } catch (e) {
      //debugPrint("=========❌posts_repo exception : ${e.toString()}❌===========");
      return BlogResponse();
    }
  }
}
