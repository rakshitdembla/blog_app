import 'package:blog_app/data/data_sources/remote_data/api_exception.dart';

import '../../presentation/screens/register/registermodel.dart';
import '../data_sources/remote_data/api_client.dart';
import '../data_sources/remote_data/api_endurls.dart';

class RegisterRepo extends ApiClient {
  RegisterRepo();

    Future<RegisterModel> postRegister({required String email,required String password,required String name}) async {
 
    try {
         var response = await postrequest(postbody: {
      "email" : email,
      "password" : password,
      "name" : name
    },
      endurlPath: ApiEndurls.Register);
      
      if (response.statusCode == 200) {
        RegisterModel Registermodel = RegisterModel.fromJson(response.data);
        return Registermodel;
      } else {
        return RegisterModel();
      }
    } 
    on ApiException {
      return RegisterModel();
    }
    
    catch (e) {
      return RegisterModel();
    }
  }


}