abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}//builder elevated button

class RegisterAuthorisedState extends RegisterStates {}

class RegisterUnauthorisedState extends RegisterStates {
  String errormessage;
  RegisterUnauthorisedState({required this.errormessage});
}

class RegisterInvalidState extends RegisterStates {
  String error;
  RegisterInvalidState({required this.error});
}
