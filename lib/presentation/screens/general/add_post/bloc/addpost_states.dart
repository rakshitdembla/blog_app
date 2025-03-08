
abstract class AddPostStates {}

class AddPostInitialState extends AddPostStates {}

class AddPostLoadingState extends AddPostStates {}

class AddPostInvalidState extends AddPostStates {
   final String message;
  AddPostInvalidState({required this.message});
}

class AddPostSuccessState extends AddPostStates {
  final String? message;
  AddPostSuccessState({required this.message});
}

class AddPostErrorState extends AddPostStates {
  final String message;
  AddPostErrorState({required this.message});
}
