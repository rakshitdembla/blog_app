part of 'router_imports.dart';

@AutoRouterConfig(replaceInRouteName: 'autoRoute')
class AppRouter extends RootStackRouter {

  @override
  RouteType get defaultRouteType => const RouteType.adaptive();
  
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashScreenRoute.page ,path: "/",initial: true),
    AutoRoute(page: OnboardRoute.page),
    AutoRoute(page: UserpageRoute.page),
  ];
}