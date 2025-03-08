import 'package:blog_app/data/data_sources/remote_data/api_client.dart';
import 'package:blog_app/data/data_sources/remote_data/api_exception.dart';
import 'package:blog_app/presentation/screens/login/login_model.dart';

import '../data_sources/remote_data/api_endurls.dart';

class LoginRepo extends ApiClient {
  LoginRepo();

    Future<LoginModel> postlogin({required String email,required String password}) async {
 
    try {
         var response = await postrequest(postbody: {
      "email" : email,
      "password" : password
    },
      endurlPath: ApiEndurls.login);
      
      if (response.statusCode == 200) {
        LoginModel loginmodel = LoginModel.fromJson(response.data);
        return loginmodel;
      } else {
        return LoginModel();
      }
    } 
    on ApiException {
      return LoginModel();
    }
    
    catch (e) {
      return LoginModel();
    }
   
  }


}