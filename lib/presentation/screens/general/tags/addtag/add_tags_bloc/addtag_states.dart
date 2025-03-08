import 'package:blog_app/data/models/message_model.dart';

abstract class AddtagStates {}

class AddtagInitialState extends AddtagStates{}
class AddtagLoadingState extends AddtagStates{}
class AddtagSuccessState extends AddtagStates{
  MessageModel messageModel;
  AddtagSuccessState({required this.messageModel});
}
class AddtagErrorState extends AddtagStates{
  String? error;
  AddtagErrorState({ this.error});
}