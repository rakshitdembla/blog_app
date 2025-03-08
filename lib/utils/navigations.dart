import 'package:auto_route/auto_route.dart';
import 'package:blog_app/presentation/screens/general/category/bloc/category_events.dart';
import 'package:blog_app/presentation/screens/general/category/bloc/category_viewmodel.dart';
import 'package:blog_app/presentation/screens/general/category/categories_model.dart';
import 'package:blog_app/presentation/screens/general/tags/bloc/tags_events.dart';
import 'package:blog_app/presentation/screens/general/tags/bloc/tags_viewmodel.dart';
import 'package:blog_app/presentation/screens/general/tags/tags_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../presentation/routes/router_imports.gr.dart';

class NavigationsData {
  NavigationsData._();

  static Future<void> AddTagNavigation(BuildContext context,bool mounted) async {
    final result = await AutoRouter.of(context).push(AddtagRoute());
    if (result == true) {
      if (context.mounted) {
        context.read<TagsViewmodel>().add(fetchtags());
      }
    }
  }
  static Future<void> AddCategoryNavigation(BuildContext context,bool mounted) async {
    final result = await AutoRouter.of(context).push(AddcategoryRoute());
    if (result == true) {
      if (context.mounted) {
          context.read<CategoryViewmodel>().add(fetchcategory());
      }
    }
  }
  static Future<void> UpdateTagNavigation(BuildContext context,bool mounted,Tag tag) async {
    final result = await AutoRouter.of(context).push(UpdateTagRoute(tag: tag));
    if (result == true) {
      if (context.mounted) {
        context.read<TagsViewmodel>().add(fetchtags());
      }
    }
  }
  static Future<void> UpdateCategoryNavigation(BuildContext context,bool mounted,EachCategory eachcategory) async {
    final result = await AutoRouter.of(context).push(UpdateCategoryRoute(category : eachcategory));
    if (result == true) {
      if (context.mounted) {
        context.read<CategoryViewmodel>().add(fetchcategory());
      }
    }
  }
}
