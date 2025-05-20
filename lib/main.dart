import 'package:blog_app/presentation/routes/router_imports.dart';
import 'package:blog_app/repositories.dart';
import 'import_exports.dart';
import 'providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String locale = await Utils.getlanguage();

  runApp(
    RepositoryProvider(
      create: (context) => AppRepositories.createRepository(),
      child: MyApp(locale: locale),
    ),
  );
}

class MyApp extends StatelessWidget {
  final String locale;
  final _appRouter = AppRouter();

  MyApp({super.key, required this.locale});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProviders.getProviders(context),
      child: I18n(
        initialLocale: locale.asLocale,
        child: ScreenUtilInit(
          designSize: const Size(390, 784),
          minTextAdapt: true,
          splitScreenMode: true,
          useInheritedMediaQuery: true,
          builder: (_, child) {
            return MaterialApp.router(
              supportedLocales: [
                'en-US'.asLocale,
                'hi-IN'.asLocale,
              ],
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              routerConfig: _appRouter.config(),
              title: MyStrings.appName,
              theme: AppThemes.light,
              darkTheme: AppThemes.dark,
              debugShowCheckedModeBanner: false,
            );
          },
        ),
      ),
    );
  }
}
