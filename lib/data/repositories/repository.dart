import 'package:blog_app/data/repositories/login_repo.dart';
import 'package:blog_app/data/repositories/tags_repo.dart';

class Repository {
  final TagsRepo tagsRepo;
  final LoginRepo loginrepo;

  Repository({required this.tagsRepo,required this.loginrepo});
}
