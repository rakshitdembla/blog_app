import 'package:blog_app/data/repositories/repository.dart';
import 'package:blog_app/presentation/screens/general/home/bloc/home_events.dart';
import 'package:blog_app/presentation/screens/general/home/bloc/home_states.dart';
import 'package:bloc/bloc.dart';

class HomeViewmodel extends Bloc<HomeEvents, HomeStates> {
  Repository repository;
  HomeViewmodel({required this.repository}) : super(HomeInitialState()) {
    on<fetchblogs>((event, emit) async {
      emit(HomeLoadingState());

      try {
        final postsdata = await repository.postsrepo.getallposts();
        

        if (postsdata.status == 1) {
          emit(HomeLoadedState(bloglist: postsdata.all_posts ?? []));
        } else {
          emit(HomeErrorState(error: "Error fetching in posts"));
        }
      } catch (e) {
        emit(HomeErrorState(error: e.toString()));
      }
    });
  }
}
