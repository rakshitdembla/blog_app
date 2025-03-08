
import 'package:bloc/bloc.dart';
import 'package:blog_app/presentation/screens/general/category/update_category/updatecategory_bloc/update_category_events.dart';
import 'package:blog_app/presentation/screens/general/category/update_category/updatecategory_bloc/update_category_states.dart';
import '../../../../../../data/repositories/repository.dart';


class UpdatecategoryViewmodel extends Bloc<UpdatecategoryEvents, UpdatecategoryStates> {
  Repository repository;
  UpdatecategoryViewmodel({required this.repository})
      : super(UpdatecategoryInitialState()) {
    on<UpdatecategoryEvent>((event, emit) async {
      emit(UpdatecategoryLoadingState());

      try {
        final categorymessage = await repository.updateCategoryRepo
            .updateCategory(title: event.title, slug: event.slug, id: event.id);

        if (categorymessage.status == 1) {
          emit(UpdatecategorySuccessState(messageModel: categorymessage));
        } else {
          emit(UpdatecategoryErrorState(error: "An error occured!"));
        }
      } catch (e) {
        emit(UpdatecategoryErrorState(error: "An error occured!"));
      }
    });
  }
}
