import 'package:blog_app/data/models/message_model.dart';

abstract class UpdatecategoryStates {}

class UpdatecategoryInitialState extends UpdatecategoryStates{}
class UpdatecategoryLoadingState extends UpdatecategoryStates{}
class UpdatecategorySuccessState extends UpdatecategoryStates{
  MessageModel messageModel;
  UpdatecategorySuccessState({required this.messageModel});
}
class UpdatecategoryErrorState extends UpdatecategoryStates{
  String? error;
  UpdatecategoryErrorState({ this.error});
}
