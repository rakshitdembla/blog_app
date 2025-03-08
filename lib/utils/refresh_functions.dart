import 'package:blog_app/presentation/screens/general/category/bloc/category_events.dart';
import 'package:blog_app/presentation/screens/general/category/bloc/category_viewmodel.dart';
import 'package:blog_app/presentation/screens/general/profile/profile_bloc/profile_events.dart';
import 'package:blog_app/presentation/screens/general/profile/profile_bloc/profile_viewmodel.dart';
import 'package:blog_app/presentation/screens/general/tags/bloc/tags_events.dart';
import 'package:blog_app/presentation/screens/general/tags/bloc/tags_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../presentation/screens/general/home/bloc/home_events.dart';
import '../presentation/screens/general/home/bloc/home_viewmodel.dart';

class RefreshFunctions {
  RefreshFunctions._();

  static Future<void> refreshhome(BuildContext context, bool mounted) async {
    await Future.delayed(Duration(seconds: 1));
    if (context.mounted) {
      context.read<HomeViewmodel>().add(fetchblogs());
    } else {}
  }

  static Future<void> refreshtags(BuildContext context, bool mounted) async {
    await Future.delayed(Duration(seconds: 1));
    if (context.mounted) {
      context.read<TagsViewmodel>().add(fetchtags());
    } else {}
  }

  static Future<void> refreshcategories(
      BuildContext context, bool mounted) async {
    await Future.delayed(Duration(seconds: 1));
    if (context.mounted) {
      context.read<CategoryViewmodel>().add(fetchcategory());
    } else {}
  }

  static Future<void> refreshprofile(BuildContext context, bool mounted) async {
    await Future.delayed(Duration(seconds: 1));
    if (context.mounted) {
      context.read<ProfileViewmodel>().add(FetchEvent());
    } else {}
  }
}
