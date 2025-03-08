import 'package:blog_app/data/repositories/repository.dart';
import 'package:blog_app/presentation/screens/general/category/addcategory/add_category_bloc/add_category_events.dart';
import 'package:blog_app/presentation/screens/general/category/addcategory/add_category_bloc/add_category_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddcategoryViewmodel extends Bloc<AddcategoryEvent, AddcategoryStates> {
  Repository repository;
  AddcategoryViewmodel({required this.repository}) : super(AddcategoryInitialState()) {
    on<AddcategoryEvent>((event, emit) async {
      emit(AddcategoryLoadingState());
     
      try {
        final categorymessage = await repository.addCategoryRepo
            .postaddCategory(title: event.title, slug: event.slug);

        if (categorymessage.status == 1) {
         
          emit(AddcategorySuccessState(messageModel: categorymessage));
        } else {
         
          emit(AddcategoryErrorState(error: "No Data Found!"));
        }
      } catch (e) {
        
        emit(AddcategoryErrorState(error: "An error occured!"));
      }
    });
  }
}
