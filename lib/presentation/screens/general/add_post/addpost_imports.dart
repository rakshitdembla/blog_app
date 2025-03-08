import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:blog_app/core/constants/my_assets.dart';
import 'package:blog_app/core/constants/my_colors.dart';
import 'package:blog_app/presentation/routes/router_imports.gr.dart';
import 'package:blog_app/presentation/screens/general/add_post/bloc/addpost_events.dart';
import 'package:blog_app/presentation/screens/general/add_post/bloc/addpost_states.dart';
import 'package:blog_app/presentation/screens/general/add_post/bloc/addpost_viewmodel.dart';
import 'package:blog_app/presentation/screens/general/category/categories_model.dart';
import 'package:blog_app/presentation/screens/general/profile/profile_bloc/profile_states.dart';
import 'package:blog_app/presentation/screens/general/profile/profile_bloc/profile_viewmodel.dart';
import 'package:blog_app/presentation/screens/general/tags/tags_model.dart';
import 'package:blog_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:fleather/fleather.dart';

import '../../../enums/navigation_type.dart';


part 'addpost.dart';
