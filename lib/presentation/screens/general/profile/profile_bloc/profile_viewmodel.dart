import 'package:blog_app/data/repositories/repository.dart';
import 'package:blog_app/presentation/screens/general/profile/profile_bloc/profile_events.dart';
import 'package:blog_app/presentation/screens/general/profile/profile_bloc/profile_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileViewmodel extends Bloc<ProfileEvents, ProfileStates> {
  Repository repository;
  ProfileViewmodel({required this.repository}) : super(ProfileInitialState()) {
    on<FetchEvent>(
      (event, emit) async {
        emit(ProfileLoadingState());

        try {
          final profilemodel = await repository.profileRepo.getuserposts();
          if (profilemodel.status == 1) {
            emit(ProfileLoadedState(profileModel: profilemodel));
          } else if (profilemodel.posts.isEmpty) {
            emit(ProfileErrorState(error: "No data found!"));
          } else {
            emit(ProfileErrorState(error: "Something went wrong!"));
          }
        } catch (e) {
          emit(ProfileErrorState(error: "An Error Occured!"));
        }
      },
    );
  }
}
