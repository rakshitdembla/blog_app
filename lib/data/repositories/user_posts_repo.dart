import 'package:blog_app/data/data_sources/remote_data/api_endurls.dart';
import 'package:blog_app/presentation/screens/general/profile/profile_model.dart';
import 'package:blog_app/utils/utils.dart';

import '../data_sources/remote_data/api_client.dart';

class ProfileRepo extends ApiClient {
  ProfileRepo();
  Future<ProfileModel> getuserposts() async {
    var gettoken = await Utils.gettoken();
    final String token = "Bearer $gettoken";

    Map<String, dynamic> tokenheader = {
      "Authorization": token,
    };

    try {
      var response = await getrequest(
          endurlPath: ApiEndurls.userposts, postheaders: tokenheader);

      if (response.statusCode == 200) {
        ProfileModel profilemodel = ProfileModel.fromJson(response.data);
        return profilemodel;
      } else {
        return ProfileModel(posts: []);
      }
    } catch (e) {
      return ProfileModel(posts: []);
    }
  }
}
