import 'package:blog_app/data/models/message_model.dart';
import 'package:blog_app/data/repositories/repository.dart';
import 'package:blog_app/presentation/screens/general/tags/delete_tag/delete_tag_bloc/delete_tag_events.dart';
import 'package:blog_app/presentation/screens/general/tags/delete_tag/delete_tag_bloc/delete_tag_states.dart';
import 'package:bloc/bloc.dart';

class DeleteTagViewModel extends Bloc<DeleteTagEvents, DeleteTagStates> {
  Repository repository;
  DeleteTagViewModel({required this.repository})
      : super(DeleteTagInitialState()) {
    on<DeleteTag>((event, emit) async {
      emit(DeleteTagLoadingState());
      try {
        MessageModel messageModel =
            await repository.deleteTagRepo.deletetag(id: event.id);

            if(messageModel.status == 1) {
              emit(DeleteTagSuccessState(messageModel: messageModel));
            } else {
              emit(DeleteTagErrorState(error: "Tag not found!"));
            }
      } catch (e) {
        emit(DeleteTagErrorState(error: "An error occured"));
      }
    });
  }
}
