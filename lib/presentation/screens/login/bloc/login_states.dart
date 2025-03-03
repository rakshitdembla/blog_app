abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class InvalidEmailState extends LoginStates {
  String? invalidMsg;
  InvalidEmailState({required this.invalidMsg});
}

class ValidEmailState extends LoginStates {
  String? validMsg;
  ValidEmailState({this.validMsg});
}

class InvalidPasswordState extends LoginStates {
  String? invalidMsg;
  InvalidPasswordState({required this.invalidMsg});
}

class ValidPasswordState extends LoginStates {
  String? validMsg;
  ValidPasswordState({this.validMsg});
}

class unauthorizedState extends LoginStates{
  String? message;
  unauthorizedState({this.message});
}
class LoggingInState extends LoginStates {
  String? message;
  LoggingInState({this.message});
}
 class LoadingState extends LoginStates {}
