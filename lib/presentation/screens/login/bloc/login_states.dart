abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginAuthorisedState extends LoginStates {}

class LoginUnauthorisedState extends LoginStates {
  String errormessage;
  LoginUnauthorisedState({required this.errormessage});
}

class LoginInvalidState extends LoginStates {
  String error;
  LoginInvalidState({required this.error});
}
