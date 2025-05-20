import 'package:blog_app/data/models/message_model.dart';

abstract class DeletePostStates {}

class DeletePostInitialState extends DeletePostStates{}
class DeletePostLoadingState extends DeletePostStates{}
class DeletePostSuccessState extends DeletePostStates{
  MessageModel messageModel;
  DeletePostSuccessState({required this.messageModel});
}
class DeletePostErrorState extends DeletePostStates{
  String? error;
  DeletePostErrorState({this.error});
}