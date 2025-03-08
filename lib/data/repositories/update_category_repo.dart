import 'package:blog_app/data/data_sources/remote_data/api_endurls.dart';
import 'package:blog_app/utils/utils.dart';
import '../data_sources/remote_data/api_client.dart';
import '../models/message_model.dart';

class UpdateCategoryRepo extends ApiClient {
  UpdateCategoryRepo();

  Future<MessageModel> updateCategory(
      {required String title, required String slug, required int id}) async {
    final token = await Utils.finaltoken();
    Map<String, dynamic> postbody = {"title": title, "slug": slug, "id": id};

    try {
      var response = await postrequest(
          endurlPath: ApiEndurls.updatecategories,
          postheaders: token,
          postbody: postbody);

      if (response.statusCode == 200) {
        MessageModel messagemodel = MessageModel.fromJson(response.data);
        return messagemodel;
      } else {
        return MessageModel();
      }
    } catch (e) {
      return MessageModel();
    }
  }
}