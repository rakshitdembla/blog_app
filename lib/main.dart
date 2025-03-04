import 'package:blog_app/core/constants/my_strings.dart';
import 'package:blog_app/core/themes/app_themes.dart';
import 'package:blog_app/data/repositories/login_repo.dart';
import 'package:blog_app/data/repositories/logout_repo.dart';
import 'package:blog_app/data/repositories/postsrepo.dart';
import 'package:blog_app/data/repositories/repository.dart';
import 'package:blog_app/data/repositories/tags_repo.dart';
import 'package:blog_app/presentation/routes/router_imports.dart';
import 'package:blog_app/presentation/screens/general/home/bloc/home_events.dart';
import 'package:blog_app/presentation/screens/general/home/bloc/home_viewmodel.dart';
import 'package:blog_app/presentation/screens/general/home/home_model.dart';
import 'package:blog_app/presentation/screens/general/profile/logout_bloc/logout_viewmodel.dart';
import 'package:blog_app/presentation/screens/general/tags/bloc/tags_events.dart';
import 'package:blog_app/presentation/screens/general/tags/bloc/tags_viewmodel.dart';
import 'package:blog_app/presentation/screens/login/bloc/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(RepositoryProvider(
    create: (context) => Repository(tagsRepo: TagsRepo(),loginrepo: LoginRepo(),logoutRepo: LogoutRepo(),postsrepo: Postsrepo()),
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
                TagsViewmodel(repository: context.read<Repository>())..add(fetchtags()),
                ),
                BlocProvider<LoginViewmodel>(
                  create: (context) => LoginViewmodel(repository: context.read<Repository>()),
              
                ),

                BlocProvider<LogoutViewmodel>(create: (context) => LogoutViewmodel(repository: context.read<Repository>())),
                BlocProvider<HomeViewmodel>(create: (context) => HomeViewmodel(repository: context.read<Repository>())..add(fetchblogs()))
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
