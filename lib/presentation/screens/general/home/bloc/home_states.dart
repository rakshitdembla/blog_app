import 'package:blog_app/presentation/screens/general/home/home_model.dart';

abstract class HomeStates {}

class HomeInitialState extends HomeStates{}
class HomeLoadingState extends HomeStates{}
class HomeLoadedState extends HomeStates{
  List<BlogPost> bloglist;
  HomeLoadedState({required this.bloglist});
}
class HomeErrorState extends HomeStates{
  String? error;
  HomeErrorState({required this.error});
}