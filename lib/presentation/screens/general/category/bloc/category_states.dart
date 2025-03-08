import 'package:blog_app/presentation/screens/general/category/categories_model.dart';




abstract class categoryStates {}

class categoryInitialState extends categoryStates {}

class categoryLoadingState extends categoryStates {}

class categoryLoadedState extends categoryStates {
  final List<EachCategory> category;
  categoryLoadedState(this.category);
}

class categoryErrorState extends categoryStates {
  final String errormsg;
  categoryErrorState(this.errormsg);
}
