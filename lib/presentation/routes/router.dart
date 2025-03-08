part of 'router_imports.dart';

@AutoRouterConfig(replaceInRouteName: 'autoRoute')
class AppRouter extends RootStackRouter {
  
  @override
  RouteType get defaultRouteType => const RouteType.custom(
        durationInMilliseconds: 200,
        transitionsBuilder: TransitionsBuilders.slideLeftWithFade, 
      );

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashScreenRoute.page, path: "/", initial: true),
    AutoRoute(page: OnboardRoute.page),
    AutoRoute(page: UserpageRoute.page),
    AutoRoute(page: LoginPageRoute.page),
    AutoRoute(page: RegisterScreenRoute.page),
    AutoRoute(page: GeneralScreenRoute.page),
    AutoRoute(page: ViewBlogRoute.page),
    AutoRoute(page: AddtagRoute.page),
    AutoRoute(page: AddcategoryRoute.page),
    AutoRoute(page: UpdateTagRoute.page),
    AutoRoute(page: UpdateCategoryRoute.page),
    AutoRoute(page: TagsRoute.page),
    AutoRoute(page: CategoriesRoute.page),
  ];
}
