import 'package:blog_app/data/data_sources/remote_data/api_client.dart';
import 'package:blog_app/presentation/screens/login/login_model.dart';
import 'package:flutter/material.dart';

import '../data_sources/remote_data/api_endurls.dart';

class LoginRepo extends ApiClient {
  LoginRepo();

    Future<LoginModel> postlogin({required String email,required String password}) async {
      //debugPrint("++++++++++++++++Post Request Sent on Repo+++++++++++++++++++");
 
    try {
         var response = await postrequest(postbody: {
      "email" : email,
      "password" : password
    },
      endurlPath: ApiEndurls.login);
      
      if (response.statusCode == 200) {
          //debugPrint("++++++++++++++++Status code : 200+++++++++++++++++++");
        LoginModel loginmodel = LoginModel.fromJson(response.data);
        return loginmodel;
      } else {
          //debugPrint("++++++++++++++++status code is not 200 empty body returned+++++++++++++++++++");
        return LoginModel();
      }
    } catch (e) {
      //debugPrint("=========❌LOGIN_repo exception : ${e.toString()}❌===========");
      return LoginModel();
    }
  }


}