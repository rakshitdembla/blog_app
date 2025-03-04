import 'package:blog_app/data/data_sources/remote_data/api_exception.dart';
import 'package:blog_app/data/models/logout_model.dart';
import 'package:blog_app/utils/utils.dart';
import 'package:flutter/material.dart';

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
          postheaders: postheaders, endurlPath: ApiEndurls.login);
      //debugPrint("🪓=======Logout Post request sent on repo======🪓");

      if (response.statusCode == 200) {
        //debugPrint("🪓=======Response code of logout = 200Ok ======🪓");
        LogoutModel logoutmodel = LogoutModel.fromJson(response.data);
        return logoutmodel;
      } else {
        //debugPrint(
            //"++++++++++++++++status code is not 200 empty body returned+++++++++++++++++++");
        return LogoutModel();
      }
    } on ApiException catch (e) {
      //debugPrint(
         // "=========❌LOGOUT_repo Api exception : ${e.toString()}❌===========");
      return LogoutModel();
    } catch (e) {
      //debugPrint(
         // "=========❌LOGOUT_repo unknown exception : ${e.toString()}❌===========");
      return LogoutModel();
    }
  }
}
