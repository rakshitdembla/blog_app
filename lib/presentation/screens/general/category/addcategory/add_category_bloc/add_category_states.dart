import 'package:blog_app/data/models/message_model.dart';

abstract class AddcategoryStates {}

class AddcategoryInitialState extends AddcategoryStates{}
class AddcategoryLoadingState extends AddcategoryStates{}
class AddcategorySuccessState extends AddcategoryStates{
  MessageModel messageModel;
  AddcategorySuccessState({required this.messageModel});
}
class AddcategoryErrorState extends AddcategoryStates{
  String? error;
  AddcategoryErrorState({ this.error});
}