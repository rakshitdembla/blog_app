import 'package:blog_app/data/models/message_model.dart';

abstract class UpdatetagStates {}

class UpdatetagInitialState extends UpdatetagStates{}
class UpdatetagLoadingState extends UpdatetagStates{}
class UpdatetagSuccessState extends UpdatetagStates{
  MessageModel messageModel;
  UpdatetagSuccessState({required this.messageModel});
}
class UpdatetagErrorState extends UpdatetagStates{
  String? error;
  UpdatetagErrorState({ this.error});
}
