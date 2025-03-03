abstract class LoginEvents {}

class emailchangeEvent extends LoginEvents{
  String? email;
  emailchangeEvent({required this.email});
}
class passchangeEvent extends LoginEvents{
  String? pass;
  passchangeEvent({required this.pass});
}

class loginEvent extends LoginEvents {
  String email;
  String password;

  loginEvent({required this.email,required this.password});
}
