import 'package:blog_app/data/models/message_model.dart';
import 'package:blog_app/data/repositories/repository.dart';
import 'package:blog_app/presentation/screens/general/add_post/bloc/addpost_events.dart';
import 'package:blog_app/presentation/screens/general/add_post/bloc/addpost_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddpostViewmodel extends Bloc<AddpostEvents, AddPostStates> {
  Repository repository;
  AddpostViewmodel({required this.repository}) : super(AddPostInitialState()) {
    on<AddPostSubmit>((event, emit) async {
      emit(AddPostLoadingState());
     
      if (event.featuredimage == null ||
          event.body == null ||
          event.title == null) {
        emit(AddPostInvalidState(
            message: "title,content & image is mandatory!"));
          
      } else if (event.userid == null) {
        emit(AddPostErrorState(message: "An error occured!"));
         
      } else {
        try {
          MessageModel messageModel = await repository.addPostRepo.postaddpost(
              title: event.title.toString(),
              slug: event.toString(),
              tagid: event.tagid!,
              categoryid: event.categoryid!,
              body: event.body.toString(),
              status: event.status!,
              userid: event.userid!,
              featuredimage: event.featuredimage!);

          if (messageModel.status == 1) {
            emit(AddPostSuccessState(message: messageModel.message.toString()));
         
          } else {
            emit(AddPostErrorState(message: "An error occured!"));
          
          }
        } catch (e) {
          emit(AddPostErrorState(message: "An error occured!"));
            

        }
      }
    });
  }
}
