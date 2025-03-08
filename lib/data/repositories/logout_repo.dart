import 'package:blog_app/data/data_sources/remote_data/api_exception.dart';
import 'package:blog_app/data/models/logout_model.dart';
import 'package:blog_app/utils/utils.dart';

import '../data_sources/remote_data/api_client.dart';
import '../data_sources/remote_data/api_endurls.dart';

class LogoutRepo extends ApiClient {
  LogoutRepo();

  Future<LogoutModel> postlogout() async {
    Map<String, dynamic> postheaders = {
      "Authorization": "Bearer ${Utils.gettoken()}"
    };

    try {
      var response = await postrequest(
          postheaders: postheaders, endurlPath: ApiEndurls.logout);

      if (response.statusCode == 200) {
        LogoutModel logoutmodel = LogoutModel.fromJson(response.data);
        return logoutmodel;
      } else {
        return LogoutModel();
      }
    } on ApiException {
      return LogoutModel();
    } catch (e) {
      return LogoutModel();
    }
  }
}
