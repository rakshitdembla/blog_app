
import 'package:auto_route/auto_route.dart';
import 'package:blog_app/core/constants/my_colors.dart';
import 'package:blog_app/presentation/routes/router_imports.gr.dart';
import 'package:blog_app/presentation/screens/general/home/bloc/home_events.dart';
import 'package:blog_app/presentation/screens/general/home/bloc/home_states.dart';
import 'package:blog_app/presentation/screens/general/home/bloc/home_viewmodel.dart';
import 'package:blog_app/presentation/screens/general/home/home_model.dart';
import 'package:blog_app/presentation/screens/general/profile/profile_bloc/profile_states.dart';
import 'package:blog_app/presentation/screens/general/profile/profile_bloc/profile_viewmodel.dart';
import 'package:blog_app/presentation/screens/general/profile/profile_imports.dart';
import 'package:blog_app/utils/refresh_functions.dart';
import 'package:blog_app/utils/utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:velocity_x/velocity_x.dart';


part 'home.dart';
