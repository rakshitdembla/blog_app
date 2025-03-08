import 'package:blog_app/presentation/screens/general/profile/profile_model.dart';

abstract class ProfileStates {}

class ProfileInitialState extends ProfileStates {}

class ProfileLoadingState extends ProfileStates {}

class ProfileLoadedState extends ProfileStates {
  ProfileModel profileModel;
  ProfileLoadedState({required this.profileModel});
}

class ProfileErrorState extends ProfileStates {
  String? error;
  ProfileErrorState({this.error});
}
