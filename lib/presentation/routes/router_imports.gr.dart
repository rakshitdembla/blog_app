// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:blog_app/presentation/screens/onboard/onboardimports.dart'
    as _i1;
import 'package:blog_app/presentation/screens/splash/splash_imports.dart'
    as _i2;
import 'package:blog_app/presentation/screens/userpage/userpage_imports.dart'
    as _i3;

/// generated route for
/// [_i1.Onboard]
class OnboardRoute extends _i4.PageRouteInfo<void> {
  const OnboardRoute({List<_i4.PageRouteInfo>? children})
    : super(OnboardRoute.name, initialChildren: children);

  static const String name = 'OnboardRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.Onboard();
    },
  );
}

/// generated route for
/// [_i2.SplashScreen]
class SplashScreenRoute extends _i4.PageRouteInfo<void> {
  const SplashScreenRoute({List<_i4.PageRouteInfo>? children})
    : super(SplashScreenRoute.name, initialChildren: children);

  static const String name = 'SplashScreenRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.SplashScreen();
    },
  );
}

/// generated route for
/// [_i3.userpage]
class UserpageRoute extends _i4.PageRouteInfo<void> {
  const UserpageRoute({List<_i4.PageRouteInfo>? children})
    : super(UserpageRoute.name, initialChildren: children);

  static const String name = 'UserpageRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.Userpage();
    },
  );
}
