abstract class LoginEvents {}

class LoginEvent extends LoginEvents {
  String email;
  String password;

  LoginEvent({required this.email, required this.password});
}
