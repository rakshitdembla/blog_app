import 'package:blog_app/data/data_sources/remote_data/api_client.dart';
import 'package:blog_app/data/data_sources/remote_data/api_endurls.dart';
import 'package:blog_app/presentation/screens/general/category/categories_model.dart';

class CategoriesRepo extends ApiClient {
  CategoriesRepo();
  Future<CategoriesModel> getallCategories() async {
   
    try {
       var response = await getrequest(endurlPath: ApiEndurls.categories);
      if (response.statusCode == 200) {
        CategoriesModel categoriesmodel = CategoriesModel.fromJson(response.data);
        return categoriesmodel;
      } else {
        return CategoriesModel();
      }
    } catch (e) {
    
      return CategoriesModel();
    }
  }
}