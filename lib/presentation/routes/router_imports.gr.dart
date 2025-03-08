// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i14;
import 'package:blog_app/presentation/enums/navigation_type.dart' as _i16;
import 'package:blog_app/presentation/screens/general/category/addcategory/addcategory_imports.dart'
    as _i1;
import 'package:blog_app/presentation/screens/general/category/categories_model.dart'
    as _i17;
import 'package:blog_app/presentation/screens/general/category/category_imports.dart'
    as _i3;
import 'package:blog_app/presentation/screens/general/category/update_category/update_category_imports.dart'
    as _i10;
import 'package:blog_app/presentation/screens/general/general_imports.dart'
    as _i4;
import 'package:blog_app/presentation/screens/general/home/home_model.dart'
    as _i19;
import 'package:blog_app/presentation/screens/general/home/view_blog.dart'
    as _i13;
import 'package:blog_app/presentation/screens/general/tags/addtag/addtag_imports.dart'
    as _i2;
import 'package:blog_app/presentation/screens/general/tags/tags_imports.dart'
    as _i9;
import 'package:blog_app/presentation/screens/general/tags/tags_model.dart'
    as _i18;
import 'package:blog_app/presentation/screens/general/tags/update_tag/update_tag_imports.dart'
    as _i11;
import 'package:blog_app/presentation/screens/login/loginpage_imports.dart'
    as _i5;
import 'package:blog_app/presentation/screens/onboard/onboardimports.dart'
    as _i6;
import 'package:blog_app/presentation/screens/register/register_imports.dart'
    as _i7;
import 'package:blog_app/presentation/screens/splash/splash_imports.dart'
    as _i8;
import 'package:blog_app/presentation/screens/userpage/userpage_imports.dart'
    as _i12;
import 'package:flutter/material.dart' as _i15;

/// generated route for
/// [_i1.Addcategory]
class AddcategoryRoute extends _i14.PageRouteInfo<void> {
  const AddcategoryRoute({List<_i14.PageRouteInfo>? children})
    : super(AddcategoryRoute.name, initialChildren: children);

  static const String name = 'AddcategoryRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i1.Addcategory();
    },
  );
}

/// generated route for
/// [_i2.Addtag]
class AddtagRoute extends _i14.PageRouteInfo<void> {
  const AddtagRoute({List<_i14.PageRouteInfo>? children})
    : super(AddtagRoute.name, initialChildren: children);

  static const String name = 'AddtagRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i2.Addtag();
    },
  );
}

/// generated route for
/// [_i3.Categories]
class CategoriesRoute extends _i14.PageRouteInfo<CategoriesRouteArgs> {
  CategoriesRoute({
    _i15.Key? key,
    required _i16.NavigationType navigationType,
    List<_i14.PageRouteInfo>? children,
  }) : super(
         CategoriesRoute.name,
         args: CategoriesRouteArgs(key: key, navigationType: navigationType),
         initialChildren: children,
       );

  static const String name = 'CategoriesRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CategoriesRouteArgs>();
      return _i3.Categories(key: args.key, navigationType: args.navigationType);
    },
  );
}

class CategoriesRouteArgs {
  const CategoriesRouteArgs({this.key, required this.navigationType});

  final _i15.Key? key;

  final _i16.NavigationType navigationType;

  @override
  String toString() {
    return 'CategoriesRouteArgs{key: $key, navigationType: $navigationType}';
  }
}

/// generated route for
/// [_i4.GeneralScreen]
class GeneralScreenRoute extends _i14.PageRouteInfo<void> {
  const GeneralScreenRoute({List<_i14.PageRouteInfo>? children})
    : super(GeneralScreenRoute.name, initialChildren: children);

  static const String name = 'GeneralScreenRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i4.GeneralScreen();
    },
  );
}

/// generated route for
/// [_i5.LoginPage]
class LoginPageRoute extends _i14.PageRouteInfo<void> {
  const LoginPageRoute({List<_i14.PageRouteInfo>? children})
    : super(LoginPageRoute.name, initialChildren: children);

  static const String name = 'LoginPageRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i5.LoginPage();
    },
  );
}

/// generated route for
/// [_i6.Onboard]
class OnboardRoute extends _i14.PageRouteInfo<void> {
  const OnboardRoute({List<_i14.PageRouteInfo>? children})
    : super(OnboardRoute.name, initialChildren: children);

  static const String name = 'OnboardRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i6.Onboard();
    },
  );
}

/// generated route for
/// [_i7.RegisterScreen]
class RegisterScreenRoute extends _i14.PageRouteInfo<void> {
  const RegisterScreenRoute({List<_i14.PageRouteInfo>? children})
    : super(RegisterScreenRoute.name, initialChildren: children);

  static const String name = 'RegisterScreenRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i7.RegisterScreen();
    },
  );
}

/// generated route for
/// [_i8.SplashScreen]
class SplashScreenRoute extends _i14.PageRouteInfo<void> {
  const SplashScreenRoute({List<_i14.PageRouteInfo>? children})
    : super(SplashScreenRoute.name, initialChildren: children);

  static const String name = 'SplashScreenRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i8.SplashScreen();
    },
  );
}

/// generated route for
/// [_i9.Tags]
class TagsRoute extends _i14.PageRouteInfo<TagsRouteArgs> {
  TagsRoute({
    _i15.Key? key,
    required _i16.NavigationType navigationType,
    List<_i14.PageRouteInfo>? children,
  }) : super(
         TagsRoute.name,
         args: TagsRouteArgs(key: key, navigationType: navigationType),
         initialChildren: children,
       );

  static const String name = 'TagsRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TagsRouteArgs>();
      return _i9.Tags(key: args.key, navigationType: args.navigationType);
    },
  );
}

class TagsRouteArgs {
  const TagsRouteArgs({this.key, required this.navigationType});

  final _i15.Key? key;

  final _i16.NavigationType navigationType;

  @override
  String toString() {
    return 'TagsRouteArgs{key: $key, navigationType: $navigationType}';
  }
}

/// generated route for
/// [_i10.UpdateCategory]
class UpdateCategoryRoute extends _i14.PageRouteInfo<UpdateCategoryRouteArgs> {
  UpdateCategoryRoute({
    _i15.Key? key,
    required _i17.EachCategory category,
    List<_i14.PageRouteInfo>? children,
  }) : super(
         UpdateCategoryRoute.name,
         args: UpdateCategoryRouteArgs(key: key, category: category),
         initialChildren: children,
       );

  static const String name = 'UpdateCategoryRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<UpdateCategoryRouteArgs>();
      return _i10.UpdateCategory(key: args.key, category: args.category);
    },
  );
}

class UpdateCategoryRouteArgs {
  const UpdateCategoryRouteArgs({this.key, required this.category});

  final _i15.Key? key;

  final _i17.EachCategory category;

  @override
  String toString() {
    return 'UpdateCategoryRouteArgs{key: $key, category: $category}';
  }
}

/// generated route for
/// [_i11.UpdateTag]
class UpdateTagRoute extends _i14.PageRouteInfo<UpdateTagRouteArgs> {
  UpdateTagRoute({
    _i15.Key? key,
    required _i18.Tag tag,
    List<_i14.PageRouteInfo>? children,
  }) : super(
         UpdateTagRoute.name,
         args: UpdateTagRouteArgs(key: key, tag: tag),
         initialChildren: children,
       );

  static const String name = 'UpdateTagRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<UpdateTagRouteArgs>();
      return _i11.UpdateTag(key: args.key, tag: args.tag);
    },
  );
}

class UpdateTagRouteArgs {
  const UpdateTagRouteArgs({this.key, required this.tag});

  final _i15.Key? key;

  final _i18.Tag tag;

  @override
  String toString() {
    return 'UpdateTagRouteArgs{key: $key, tag: $tag}';
  }
}

/// generated route for
/// [_i12.Userpage]
class UserpageRoute extends _i14.PageRouteInfo<void> {
  const UserpageRoute({List<_i14.PageRouteInfo>? children})
    : super(UserpageRoute.name, initialChildren: children);

  static const String name = 'UserpageRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i12.Userpage();
    },
  );
}

/// generated route for
/// [_i13.ViewBlog]
class ViewBlogRoute extends _i14.PageRouteInfo<ViewBlogRouteArgs> {
  ViewBlogRoute({
    _i15.Key? key,
    required _i19.BlogPost blogpost,
    List<_i14.PageRouteInfo>? children,
  }) : super(
         ViewBlogRoute.name,
         args: ViewBlogRouteArgs(key: key, blogpost: blogpost),
         initialChildren: children,
       );

  static const String name = 'ViewBlogRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ViewBlogRouteArgs>();
      return _i13.ViewBlog(key: args.key, blogpost: args.blogpost);
    },
  );
}

class ViewBlogRouteArgs {
  const ViewBlogRouteArgs({this.key, required this.blogpost});

  final _i15.Key? key;

  final _i19.BlogPost blogpost;

  @override
  String toString() {
    return 'ViewBlogRouteArgs{key: $key, blogpost: $blogpost}';
  }
}
