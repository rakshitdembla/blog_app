import 'package:blog_app/data/models/message_model.dart';
import 'package:blog_app/data/repositories/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:blog_app/presentation/screens/general/category/delete_category/delete_tag_bloc/delete_category_events.dart';
import 'package:blog_app/presentation/screens/general/category/delete_category/delete_tag_bloc/delete_category_states.dart';

class DeleteCategoryViewModel extends Bloc<DeleteCategoryEvents, DeleteCategoryStates> {
  Repository repository;
  DeleteCategoryViewModel({required this.repository})
      : super(DeleteCategoryInitialState()) {
    on<DeleteCategory>((event, emit) async {
      emit(DeleteCategoryLoadingState());
      try {
        MessageModel messageModel =
            await repository.deleteCategoryRepo.deleteCategory(id: event.id);

            if(messageModel.status == 1) {
              emit(DeleteCategorySuccessState(messageModel: messageModel));
            } else {
              emit(DeleteCategoryErrorState(error: "Category not found!"));
            }
      } catch (e) {
        emit(DeleteCategoryErrorState(error: "An error occured"));
      }
    });
  }
}
