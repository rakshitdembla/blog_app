import 'package:auto_route/auto_route.dart';
import 'package:blog_app/core/constants/my_colors.dart';
import 'package:blog_app/presentation/common_widgets/commonwidgets_imports.dart';
import 'package:blog_app/presentation/routes/router_imports.gr.dart';
import 'package:blog_app/presentation/screens/register/bloc/register_states.dart';
import 'package:blog_app/presentation/screens/register/bloc/registerevents.dart';
import 'package:blog_app/presentation/screens/register/bloc/registerview_model.dart';
import 'package:blog_app/utils/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../login/login_widgets/login_widgets_imports.dart';

part 'register_container.dart';