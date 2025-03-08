import 'package:blog_app/data/models/message_model.dart';

abstract class DeleteCategoryStates {}

class DeleteCategoryInitialState extends DeleteCategoryStates{}
class DeleteCategoryLoadingState extends DeleteCategoryStates{}
class DeleteCategorySuccessState extends DeleteCategoryStates{
  MessageModel messageModel;
  DeleteCategorySuccessState({required this.messageModel});
}
class DeleteCategoryErrorState extends DeleteCategoryStates{
  String? error;
  DeleteCategoryErrorState({this.error});
}