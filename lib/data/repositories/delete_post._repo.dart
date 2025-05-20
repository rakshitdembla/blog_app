import 'package:blog_app/data/data_sources/remote_data/api_client.dart';
import 'package:blog_app/data/models/message_model.dart';

import '../../utils/utils.dart';
import '../data_sources/remote_data/api_endurls.dart';

class DeletePostRepo extends ApiClient {
  DeletePostRepo();

  Future<MessageModel> deletepost({required int id}) async {
    final token = await Utils.finaltoken();

    try {
      var response = await postrequest(
          endurlPath: "${ApiEndurls.deletepost}/$id", postheaders: token);

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