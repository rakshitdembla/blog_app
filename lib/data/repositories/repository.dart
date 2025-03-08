import 'package:blog_app/data/repositories/add_category_repo.dart';
import 'package:blog_app/data/repositories/add_post_repo.dart';
import 'package:blog_app/data/repositories/add_tag_repo.dart';
import 'package:blog_app/data/repositories/categories_repo.dart';
import 'package:blog_app/data/repositories/delete_category_repo.dart';
import 'package:blog_app/data/repositories/delete_tag_repo.dart';
import 'package:blog_app/data/repositories/update_category_repo.dart';
import 'package:blog_app/data/repositories/update_tag_repo.dart';
import 'package:blog_app/data/repositories/login_repo.dart';
import 'package:blog_app/data/repositories/logout_repo.dart';
import 'package:blog_app/data/repositories/postsrepo.dart';
import 'package:blog_app/data/repositories/register_Repo.dart';
import 'package:blog_app/data/repositories/tags_repo.dart';
import 'package:blog_app/data/repositories/user_posts_repo.dart';

class Repository {
  final TagsRepo tagsRepo;
  final LoginRepo loginrepo;
  final LogoutRepo logoutRepo;
  final Postsrepo postsrepo;
  final ProfileRepo profileRepo;
  final AddTagRepo addTagRepo;
  final DeleteTagRepo deleteTagRepo;
  final UpdateTagRepo updateTagRepo;
  final RegisterRepo registerRepo;
  final CategoriesRepo categoriesRepo;
  final UpdateCategoryRepo updateCategoryRepo;
  final DeleteCategoryRepo deleteCategoryRepo;
  final AddCategoryRepo addCategoryRepo;
  final AddPostRepo addPostRepo;

  Repository({
    required this.addPostRepo,
    required this.tagsRepo,
    required this.addTagRepo,
    required this.loginrepo,
    required this.logoutRepo,
    required this.postsrepo,
    required this.profileRepo,
    required this.updateTagRepo,
    required this.deleteTagRepo,
    required this.registerRepo,
    required this.categoriesRepo,
    required this.updateCategoryRepo,
    required this.deleteCategoryRepo,
    required this.addCategoryRepo,
  });
}
