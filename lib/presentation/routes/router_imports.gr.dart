// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:blog_app/presentation/screens/general/general_imports.dart'
    as _i1;
import 'package:blog_app/presentation/screens/general/home/home_model.dart'
    as _i10;
import 'package:blog_app/presentation/screens/general/home/view_blog.dart'
    as _i7;
import 'package:blog_app/presentation/screens/login/loginpage_imports.dart'
    as _i2;
import 'package:blog_app/presentation/screens/onboard/onboardimports.dart'
    as _i3;
import 'package:blog_app/presentation/screens/regster/register_imports.dart'
    as _i4;
import 'package:blog_app/presentation/screens/splash/splash_imports.dart'
    as _i5;
import 'package:blog_app/presentation/screens/userpage/userpage_imports.dart'
    as _i6;
import 'package:flutter/material.dart' as _i9;

/// generated route for
/// [_i1.GeneralScreen]
class GeneralScreenRoute extends _i8.PageRouteInfo<void> {
  const GeneralScreenRoute({List<_i8.PageRouteInfo>? children})
    : super(GeneralScreenRoute.name, initialChildren: children);

  static const String name = 'GeneralScreenRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i1.GeneralScreen();
    },
  );
}

/// generated route for
/// [_i2.LoginPage]
class LoginPageRoute extends _i8.PageRouteInfo<void> {
  const LoginPageRoute({List<_i8.PageRouteInfo>? children})
    : super(LoginPageRoute.name, initialChildren: children);

  static const String name = 'LoginPageRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i2.LoginPage();
    },
  );
}

/// generated route for
/// [_i3.Onboard]
class OnboardRoute extends _i8.PageRouteInfo<void> {
  const OnboardRoute({List<_i8.PageRouteInfo>? children})
    : super(OnboardRoute.name, initialChildren: children);

  static const String name = 'OnboardRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i3.Onboard();
    },
  );
}

/// generated route for
/// [_i4.RegisterScreen]
class RegisterScreenRoute extends _i8.PageRouteInfo<void> {
  const RegisterScreenRoute({List<_i8.PageRouteInfo>? children})
    : super(RegisterScreenRoute.name, initialChildren: children);

  static const String name = 'RegisterScreenRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i4.RegisterScreen();
    },
  );
}

/// generated route for
/// [_i5.SplashScreen]
class SplashScreenRoute extends _i8.PageRouteInfo<void> {
  const SplashScreenRoute({List<_i8.PageRouteInfo>? children})
    : super(SplashScreenRoute.name, initialChildren: children);

  static const String name = 'SplashScreenRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i5.SplashScreen();
    },
  );
}

/// generated route for
/// [_i6.Userpage]
class UserpageRoute extends _i8.PageRouteInfo<void> {
  const UserpageRoute({List<_i8.PageRouteInfo>? children})
    : super(UserpageRoute.name, initialChildren: children);

  static const String name = 'UserpageRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i6.Userpage();
    },
  );
}

/// generated route for
/// [_i7.ViewBlog]
class ViewBlogRoute extends _i8.PageRouteInfo<ViewBlogRouteArgs> {
  ViewBlogRoute({
    _i9.Key? key,
    required _i10.BlogPost blogpost,
    List<_i8.PageRouteInfo>? children,
  }) : super(
         ViewBlogRoute.name,
         args: ViewBlogRouteArgs(key: key, blogpost: blogpost),
         initialChildren: children,
       );

  static const String name = 'ViewBlogRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ViewBlogRouteArgs>();
      return _i7.ViewBlog(key: args.key, blogpost: args.blogpost);
    },
  );
}

class ViewBlogRouteArgs {
  const ViewBlogRouteArgs({this.key, required this.blogpost});

  final _i9.Key? key;

  final _i10.BlogPost blogpost;

  @override
  String toString() {
    return 'ViewBlogRouteArgs{key: $key, blogpost: $blogpost}';
  }
}
