import 'package:blog_app/data/models/message_model.dart';

abstract class DeleteTagStates {}

class DeleteTagInitialState extends DeleteTagStates{}
class DeleteTagLoadingState extends DeleteTagStates{}
class DeleteTagSuccessState extends DeleteTagStates{
  MessageModel messageModel;
  DeleteTagSuccessState({required this.messageModel});
}
class DeleteTagErrorState extends DeleteTagStates{
  String? error;
  DeleteTagErrorState({this.error});
}