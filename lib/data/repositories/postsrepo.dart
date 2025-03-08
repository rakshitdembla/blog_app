import 'package:blog_app/presentation/screens/general/home/home_model.dart';

import '../data_sources/remote_data/api_client.dart';
import '../data_sources/remote_data/api_endurls.dart';

class Postsrepo extends ApiClient {
  Postsrepo();
  
  Future<BlogResponse> getallposts() async {
    try {
      var response = await getrequest(endurlPath: ApiEndurls.posts);
      if (response.statusCode == 200) {
        BlogResponse blogResponse = BlogResponse.fromJson(response.data);

        return blogResponse;
      } else {
        return BlogResponse();
      }
    } catch (e) {
      return BlogResponse();
    }
  }
}
