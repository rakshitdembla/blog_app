import 'package:auto_route/auto_route.dart';
import 'package:blog_app/presentation/enums/navigation_type.dart';
import 'package:blog_app/presentation/screens/general/category/bloc/category_events.dart';
import 'package:blog_app/presentation/screens/general/category/bloc/category_states.dart';
import 'package:blog_app/presentation/screens/general/category/bloc/category_viewmodel.dart';
import 'package:blog_app/presentation/screens/general/category/categories_model.dart';
import 'package:blog_app/presentation/screens/general/category/delete_category/delete_tag_bloc/delete_category_events.dart';
import 'package:blog_app/presentation/screens/general/category/delete_category/delete_tag_bloc/delete_category_states.dart';
import 'package:blog_app/presentation/screens/general/category/delete_category/delete_tag_bloc/delete_category_view_model.dart';
import 'package:blog_app/utils/navigations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../core/constants/my_colors.dart';
import '../../../../utils/refresh_functions.dart';
import '../../../../utils/utils.dart';

part 'category.dart';