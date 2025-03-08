import 'package:blog_app/data/repositories/repository.dart';
import 'package:blog_app/presentation/screens/general/tags/addtag/add_tags_bloc/addtag_events.dart';
import 'package:blog_app/presentation/screens/general/tags/addtag/add_tags_bloc/addtag_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddtagViewmodel extends Bloc<AddtagEvent, AddtagStates> {
  Repository repository;
  AddtagViewmodel({required this.repository}) : super(AddtagInitialState()) {
    on<AddtagEvent>((event, emit) async {
      emit(AddtagLoadingState());
   
      try {
        final tagmessage = await repository.addTagRepo
            .postaddtag(title: event.title, slug: event.slug);

        if (tagmessage.status == 1) {
     
          emit(AddtagSuccessState(messageModel: tagmessage));
        } else {
         
          emit(AddtagErrorState(error: "No Data Found!"));
        }
      } catch (e) {
        
        
        emit(AddtagErrorState(error: "An error occured!"));
      }
    });
  }
}
