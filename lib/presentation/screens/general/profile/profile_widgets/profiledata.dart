import 'package:auto_route/auto_route.dart';
import 'package:blog_app/presentation/routes/router_imports.gr.dart';
import 'package:blog_app/presentation/screens/general/profile/profile_bloc/profile_states.dart';
import 'package:blog_app/presentation/screens/general/profile/profile_bloc/profile_viewmodel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';


import '../../../../../core/constants/my_colors.dart';
import '../../../../../utils/utils.dart';
import '../logout_bloc/logout_events.dart';
import '../logout_bloc/logout_states.dart';
import '../logout_bloc/logout_viewmodel.dart';

class ProfileData extends StatefulWidget {
  const ProfileData({super.key});

  @override
  State<ProfileData> createState() => _ProfileDataState();
}

class _ProfileDataState extends State<ProfileData> {
  @override
  Widget build(BuildContext context) {
    return  Align(
        alignment: Alignment.topCenter,
        child: BlocBuilder<ProfileViewmodel, ProfileStates>(
          builder: (context, state) {
            if (state is ProfileLoadedState) {
              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.55,
                decoration: BoxDecoration(
                    color: MyColors.primarycolor,
                    borderRadius: BorderRadius.circular(30)),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 40, 10, 0),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: BlocListener<LogoutViewmodel, LogoutStates>(
                            listener: (context, state) {
                              if (state is LogoutFailed) {
                                Utils.errorsnackbar(
                                    message: state.message.toString(),
                                    context: context);
                              } else if (state is LogoutLoadingState) {
                                Utils.normalsnackbar(
                                    message: state.message.toString(),
                                    context: context);
                              } else if (state is LogoutLoggingout) {
                                Utils.successsnackbar(
                                    message: state.message.toString(),
                                    context: context);
                                AutoRouter.of(context).pushAndPopUntil(
                                    UserpageRoute(),
                                    predicate: (route) => false);
                              }
                            },
                            child: IconButton(
                              onPressed: () {
                                context
                                    .read<LogoutViewmodel>()
                                    .add(LogoutEvent());
                              },
                              icon: Icon(
                                size: 25,
                                Icons.logout,
                                color: MyColors.whitecolor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 55,
                        backgroundColor: Colors.grey[300],
                        child: state.profileModel.userDetails!.profilePhotoUrl !=
                                null
                            ? SizedBox(
                                height: 110,
                                width: 110,
                                child: ClipOval(
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl: state
                                        .profileModel.userDetails!.profilePhotoUrl
                                        .toString(),
                                    errorWidget: (context, url, error) => Center(
                                      child: Icon(Icons.person,size: 60,),
                                    ),
                                  ),
                                ),
                              )
                            : Icon(Icons.person, size: 60),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        state.profileModel.userDetails!.name.toString(),
                        style: TextStyle(
                            color: MyColors.whitetextcolor,
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        state.profileModel.userDetails!.email.toString(),
                        style: TextStyle(color: MyColors.whitetextcolor),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text( state.profileModel.userDetails!.about != null ?
                        state.profileModel.userDetails!.about.toString() : "No bio yet, but the vibes are strong!",
                        style: TextStyle(color: MyColors.whitetextcolor),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(
                                state.profileModel.posts.length.toString(),
                                style: TextStyle(
                                    color: MyColors.whitetextcolor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "Posts",
                                style: TextStyle(color: MyColors.whitetextcolor),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "10",
                                style: TextStyle(
                                    color: MyColors.whitetextcolor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "Following",
                                style: TextStyle(color: MyColors.whitetextcolor),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "89",
                                style: TextStyle(
                                    color: MyColors.whitetextcolor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "Followers",
                                style: TextStyle(color: MyColors.whitetextcolor),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.55,
              decoration: BoxDecoration(
                  color: MyColors.primarycolor,
                  borderRadius: BorderRadius.circular(30)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 40, 10, 0),
                    child: Align(
                      alignment: Alignment.topRight,
                    ),
                  ),
                  Center(
                    child: LoadingAnimationWidget.stretchedDots(
                color: const Color.fromARGB(255, 255, 255, 255),
                size: 30,
              ),
                  ),
                ],
              ),
            );
          },
        ),
      );
  
  }
}
