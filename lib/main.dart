import 'package:blog_app/core/constants/my_strings.dart';
import 'package:blog_app/core/themes/app_themes.dart';
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
import 'package:blog_app/data/repositories/repository.dart';
import 'package:blog_app/data/repositories/tags_repo.dart';
import 'package:blog_app/data/repositories/user_posts_repo.dart';
import 'package:blog_app/presentation/routes/router_imports.dart';
import 'package:blog_app/presentation/screens/general/add_post/bloc/addpost_viewmodel.dart';
import 'package:blog_app/presentation/screens/general/category/addcategory/add_category_bloc/add_category_viewmodel.dart';
import 'package:blog_app/presentation/screens/general/category/bloc/category_viewmodel.dart';
import 'package:blog_app/presentation/screens/general/category/delete_category/delete_tag_bloc/delete_category_view_model.dart';
import 'package:blog_app/presentation/screens/general/category/update_category/updatecategory_bloc/update_category_viewmodel.dart';
import 'package:blog_app/presentation/screens/general/home/bloc/home_viewmodel.dart';
import 'package:blog_app/presentation/screens/general/profile/logout_bloc/logout_viewmodel.dart';
import 'package:blog_app/presentation/screens/general/profile/profile_bloc/profile_viewmodel.dart';
import 'package:blog_app/presentation/screens/general/tags/addtag/add_tags_bloc/addtag_viewmodel.dart';
import 'package:blog_app/presentation/screens/general/tags/bloc/tags_viewmodel.dart';
import 'package:blog_app/presentation/screens/general/tags/delete_tag/delete_tag_bloc/delete_tag_view_model.dart';
import 'package:blog_app/presentation/screens/general/tags/update_tag/updatetag_bloc/updatetag_viewmodel.dart';
import 'package:blog_app/presentation/screens/login/bloc/login_viewmodel.dart';
import 'package:blog_app/presentation/screens/register/bloc/registerview_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(RepositoryProvider(
    create: (context) => Repository(
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
        addTagRepo: AddTagRepo()),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TagsViewmodel>(
            create: (context) =>
                TagsViewmodel(repository: context.read<Repository>())),
        BlocProvider<CategoryViewmodel>(
            create: (context) =>
                CategoryViewmodel(repository: context.read<Repository>())),
        BlocProvider<LoginViewmodel>(
          create: (context) =>
              LoginViewmodel(repository: context.read<Repository>()),
        ),
        BlocProvider<LogoutViewmodel>(
            create: (context) =>
                LogoutViewmodel(repository: context.read<Repository>())),
        BlocProvider<HomeViewmodel>(
            create: (context) =>
                HomeViewmodel(repository: context.read<Repository>())),
        BlocProvider<ProfileViewmodel>(
            create: (context) =>
                ProfileViewmodel(repository: context.read<Repository>())),
        BlocProvider<AddtagViewmodel>(
            create: (context) =>
                AddtagViewmodel(repository: context.read<Repository>())),
        BlocProvider<AddcategoryViewmodel>(
            create: (context) =>
                AddcategoryViewmodel(repository: context.read<Repository>())),
        BlocProvider<UpdatetagViewmodel>(
            create: (context) =>
                UpdatetagViewmodel(repository: context.read<Repository>())),
        BlocProvider<UpdatecategoryViewmodel>(
            create: (context) => UpdatecategoryViewmodel(
                repository: context.read<Repository>())),
        BlocProvider<DeleteTagViewModel>(
            create: (context) =>
                DeleteTagViewModel(repository: context.read<Repository>())),
        BlocProvider<DeleteCategoryViewModel>(
            create: (context) => DeleteCategoryViewModel(
                repository: context.read<Repository>())),
        BlocProvider<RegisterViewmodel>(
            create: (context) =>
                RegisterViewmodel(repository: context.read<Repository>())),
        BlocProvider<AddpostViewmodel>(
            create: (context) =>
                AddpostViewmodel(repository: context.read<Repository>())),
      ],
      child: ScreenUtilInit(
          designSize: const Size(390, 784),
          minTextAdapt: true,
          splitScreenMode: true,
          useInheritedMediaQuery: true,
          builder: (_, child) {
            return MaterialApp.router(
              routerConfig: _appRouter.config(),
              title: MyStrings.appName,
              theme: AppThemes.light,
              darkTheme: AppThemes.dark,
              debugShowCheckedModeBanner: false,
            );
          }),
    );
  }
}
