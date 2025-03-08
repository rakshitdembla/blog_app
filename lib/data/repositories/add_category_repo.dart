import 'package:blog_app/data/models/message_model.dart';
import 'package:blog_app/utils/utils.dart';

import '../data_sources/remote_data/api_client.dart';
import '../data_sources/remote_data/api_endurls.dart';

class AddCategoryRepo extends ApiClient {
  AddCategoryRepo();

  Future<MessageModel> postaddCategory(
      {required String title, required String slug}) async {
    final gettoken = await Utils.gettoken();
    final String token = "Bearer $gettoken";

    Map<String, dynamic> postheaders = {"Authorization": token};
    Map<String, dynamic> postbody = {"title": title, "slug": slug};
    try {
      var response = await postrequest(
          endurlPath: ApiEndurls.addcategories,
          postheaders: postheaders,
          postbody: postbody);

      if (response.statusCode == 200) {
        MessageModel addCategorys = MessageModel.fromJson(response.data);
        return addCategorys;
      } else {
        return MessageModel();
      }
    } catch (e) {
      return MessageModel();
    }
  }
}
