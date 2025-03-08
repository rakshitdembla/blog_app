import 'package:blog_app/presentation/screens/general/tags/update_tag/updatetag_bloc/updatetag_states.dart';
import 'package:blog_app/presentation/screens/general/tags/update_tag/updatetag_bloc/updtetag_events.dart';
import 'package:bloc/bloc.dart';
import '../../../../../../data/repositories/repository.dart';

class UpdatetagViewmodel extends Bloc<UpdatetagEvents, UpdatetagStates> {
  Repository repository;
  UpdatetagViewmodel({required this.repository})
      : super(UpdatetagInitialState()) {
    on<UpdatetagEvent>((event, emit) async {
      emit(UpdatetagLoadingState());
   
      try {
        final tagmessage = await repository.updateTagRepo
            .updatetag(title: event.title, slug: event.slug, id: event.id);

        if (tagmessage.status == 1) {
       
          emit(UpdatetagSuccessState(messageModel: tagmessage));
        } else {
         
          emit(UpdatetagErrorState(error: "An error occured!"));
        }
      } catch (e) {
       
        emit(UpdatetagErrorState(error: "An error occured!"));
      }
    });
  }
}
