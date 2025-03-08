import 'package:blog_app/data/models/message_model.dart';
import 'package:blog_app/utils/utils.dart';

import '../data_sources/remote_data/api_client.dart';
import '../data_sources/remote_data/api_endurls.dart';

class AddTagRepo extends ApiClient {
  AddTagRepo();

  Future<MessageModel> postaddtag(
      {required String title, required String slug}) async {
    final gettoken = await Utils.gettoken();
    final String token = "Bearer $gettoken";
   
    Map<String, dynamic> postheaders = {"Authorization": token};
    Map<String, dynamic> postbody = {"title": title, "slug": slug};
   
    try {
      var response = await postrequest(
          endurlPath: ApiEndurls.addtags,
          postheaders: postheaders,
          postbody: postbody);

      if (response.statusCode == 200) {
        
        MessageModel addtags = MessageModel.fromJson(response.data);
          
        return addtags;
      } else {
          
        return MessageModel();
        
      }
    } catch (e) {
        
      return MessageModel();

    }
  }
}
