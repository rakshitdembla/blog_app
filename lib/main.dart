import 'package:blog_app/core/constants/my_strings.dart';
import 'package:blog_app/core/themes/app_themes.dart';
import 'package:blog_app/presentation/routes/router_imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  debugPaintBaselinesEnabled : true;
  runApp(MyApp());
  
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 784),
      minTextAdapt: true,
      splitScreenMode: true,
     useInheritedMediaQuery: true,
      builder: (_ , child) {
        return MaterialApp.router(
        routerConfig: _appRouter.config(),
        title: MyStrings.appName,
        theme : AppThemes.light,
        darkTheme: AppThemes.dark,
        debugShowCheckedModeBanner: false,
      );}
    );
  }
}
