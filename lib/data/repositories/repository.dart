import 'package:blog_app/data/repositories/login_repo.dart';
import 'package:blog_app/data/repositories/logout_repo.dart';
import 'package:blog_app/data/repositories/postsrepo.dart';
import 'package:blog_app/data/repositories/tags_repo.dart';

class Repository {
  final TagsRepo tagsRepo;
  final LoginRepo loginrepo;
  final LogoutRepo logoutRepo;
  final Postsrepo postsrepo;

  Repository({required this.tagsRepo,required this.loginrepo,required this.logoutRepo,required this.postsrepo});
}
