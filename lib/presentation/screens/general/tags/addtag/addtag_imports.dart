import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:blog_app/presentation/common_widgets/commonwidgets_imports.dart';
import 'package:blog_app/presentation/screens/general/tags/addtag/add_tags_bloc/addtag_events.dart';
import 'package:blog_app/presentation/screens/general/tags/addtag/add_tags_bloc/addtag_states.dart';
import 'package:blog_app/presentation/screens/general/tags/addtag/add_tags_bloc/addtag_viewmodel.dart';
import 'package:blog_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../core/constants/my_colors.dart';

part 'addtag.dart';