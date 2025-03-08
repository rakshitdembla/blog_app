import 'package:blog_app/data/data_sources/remote_data/api_client.dart';
import 'package:blog_app/data/data_sources/remote_data/api_endurls.dart';
import 'package:blog_app/presentation/screens/general/tags/tags_model.dart';

class TagsRepo extends ApiClient {
  TagsRepo();
  Future<TagModel> getalltags() async {
   
    try {
       var response = await getrequest(endurlPath: ApiEndurls.tags);
      if (response.statusCode == 200) {
        TagModel tagmodel = TagModel.fromjson(response.data);
        return tagmodel;
      } else {
        return TagModel();
      }
    } catch (e) {
   
      return TagModel();
    }
  }
}
