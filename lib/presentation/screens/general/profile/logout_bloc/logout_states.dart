abstract class LogoutStates {}

class LogoutInitialState extends LogoutStates{}
class LogoutLoadingState extends LogoutStates{String? message;
  LogoutLoadingState({required this.message});}
class LogoutLoggingout extends LogoutStates{
  String? message;
  LogoutLoggingout({required this.message});
}
class LogoutFailed extends LogoutStates{
  String? message;
  LogoutFailed({required this.message});
}