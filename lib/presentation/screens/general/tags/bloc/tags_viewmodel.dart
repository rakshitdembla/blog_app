import 'package:bloc/bloc.dart';
import 'package:blog_app/data/repositories/repository.dart';
import 'package:blog_app/presentation/screens/general/tags/bloc/tags_events.dart';
import 'package:blog_app/presentation/screens/general/tags/bloc/tags_states.dart';

class TagsViewmodel extends Bloc<TagsEvents, TagsStates> {
  final Repository repository;

  TagsViewmodel({required this.repository}) : super(TagsInitialState()) {
    on<fetchtags>(
      (event, emit) async {
        emit(TagsLoadingState());

        try {
          final tagsdata = await repository.tagsRepo.getalltags();
          if (tagsdata.status == 1) {
            emit(TagsLoadedState(tagsdata.tags ?? []));
          } else {
            emit(TagsErrorState("No Tags Found!"));
          }
        } catch (e) {
          emit(TagsErrorState("Error : $e"));
        }
      },
    );
  }
}
