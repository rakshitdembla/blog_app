import 'package:auto_route/auto_route.dart';
import 'package:blog_app/presentation/screens/general/tags/update_tag/updatetag_bloc/updatetag_states.dart';
import 'package:blog_app/presentation/screens/general/tags/update_tag/updatetag_bloc/updatetag_viewmodel.dart';
import 'package:blog_app/presentation/screens/general/tags/update_tag/updatetag_bloc/updtetag_events.dart';
import 'package:blog_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/my_colors.dart';
import '../../../../common_widgets/commonwidgets_imports.dart';
import '../tags_model.dart';

part 'update_tag.dart';