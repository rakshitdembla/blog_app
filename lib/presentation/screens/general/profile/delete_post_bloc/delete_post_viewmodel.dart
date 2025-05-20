import 'package:blog_app/data/models/message_model.dart';
import 'package:blog_app/data/repositories/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:blog_app/presentation/screens/general/profile/delete_post_bloc/delete_post_events.dart';
import 'package:blog_app/presentation/screens/general/profile/delete_post_bloc/delete_post_states.dart';

class DeletePostViewModel extends Bloc<DeletePostEvents, DeletePostStates> {
  Repository repository;
  DeletePostViewModel({required this.repository})
      : super(DeletePostInitialState()) {
    on<DeletePost>((event, emit) async {
      emit(DeletePostLoadingState());
      try {
        MessageModel messageModel =
            await repository.deletePostRepo.deletepost(id: event.id);

            if(messageModel.status == 1) {
              emit(DeletePostSuccessState(messageModel: messageModel));
            } else {
              emit(DeletePostErrorState(error: "Post not found!"));
            }
      } catch (e) {
        emit(DeletePostErrorState(error: "An error occured"));
      }
    });
  }
}
