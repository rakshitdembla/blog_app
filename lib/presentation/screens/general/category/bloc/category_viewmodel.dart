import 'package:bloc/bloc.dart';
import 'package:blog_app/data/repositories/repository.dart';
import 'package:blog_app/presentation/screens/general/category/bloc/category_events.dart';
import 'package:blog_app/presentation/screens/general/category/bloc/category_states.dart';

class CategoryViewmodel extends Bloc<categoryEvents, categoryStates> {
  final Repository repository;

  CategoryViewmodel({required this.repository}) : super(categoryInitialState()) {
    on<fetchcategory>(
      (event, emit) async {
        emit(categoryLoadingState());

        try {
          final categorydata = await repository.categoriesRepo.getallCategories();
          if (categorydata.status == 1) {
            emit(categoryLoadedState(categorydata.categories ?? []));
          } else {
            emit(categoryErrorState("No category Found!"));
          }
        } catch (e) {
          emit(categoryErrorState("Error : $e"));
        }
      },
    );
  }
}
