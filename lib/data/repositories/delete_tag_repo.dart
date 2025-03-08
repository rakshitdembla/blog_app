import 'package:blog_app/data/models/message_model.dart';
import 'package:blog_app/utils/utils.dart';

import '../data_sources/remote_data/api_client.dart';
import '../data_sources/remote_data/api_endurls.dart';

class DeleteTagRepo extends ApiClient {
  DeleteTagRepo();

  Future<MessageModel> deletetag({required int id}) async {
    final token = await Utils.finaltoken();

    try {
      var response = await postrequest(
          endurlPath: "${ApiEndurls.deletetag}/$id", postheaders: token);

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
