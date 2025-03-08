import 'package:auto_route/auto_route.dart';
import 'package:blog_app/core/constants/my_colors.dart';
import 'package:blog_app/presentation/enums/navigation_type.dart';
import 'package:blog_app/presentation/routes/router_imports.gr.dart';
import 'package:blog_app/presentation/screens/general/tags/bloc/tags_events.dart';
import 'package:blog_app/presentation/screens/general/tags/bloc/tags_states.dart';
import 'package:blog_app/presentation/screens/general/tags/bloc/tags_viewmodel.dart';
import 'package:blog_app/presentation/screens/general/tags/delete_tag/delete_tag_bloc/delete_tag_events.dart';
import 'package:blog_app/presentation/screens/general/tags/delete_tag/delete_tag_bloc/delete_tag_states.dart';
import 'package:blog_app/presentation/screens/general/tags/delete_tag/delete_tag_bloc/delete_tag_view_model.dart';
import 'package:blog_app/presentation/screens/general/tags/tags_model.dart';
import 'package:blog_app/utils/navigations.dart';
import 'package:blog_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../utils/refresh_functions.dart';

part 'tags.dart';