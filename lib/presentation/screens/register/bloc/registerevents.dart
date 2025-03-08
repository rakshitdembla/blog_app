abstract class RegisterEvents {}

class RegisterSubmit extends RegisterEvents {
  String email;
  String password;
  String name;

  RegisterSubmit({required this.email, required this.password,required this.name});
}
