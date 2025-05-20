import 'import_exports.dart';

class AppRepositories {
  static Repository createRepository() {
    return Repository(
      deletePostRepo: DeletePostRepo(),
      addPostRepo: AddPostRepo(),
      categoriesRepo: CategoriesRepo(),
      updateCategoryRepo: UpdateCategoryRepo(),
      deleteCategoryRepo: DeleteCategoryRepo(),
      addCategoryRepo: AddCategoryRepo(),
      registerRepo: RegisterRepo(),
      updateTagRepo: UpdateTagRepo(),
      deleteTagRepo: DeleteTagRepo(),
      tagsRepo: TagsRepo(),
      loginrepo: LoginRepo(),
      logoutRepo: LogoutRepo(),
      postsrepo: Postsrepo(),
      profileRepo: ProfileRepo(),
      addTagRepo: AddTagRepo(),
    );
  }
}
