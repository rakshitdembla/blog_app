import 'package:blog_app/data/repositories/repository.dart';
import 'package:blog_app/presentation/screens/login/bloc/login_events.dart';
import 'package:blog_app/presentation/screens/login/bloc/login_states.dart';
import 'package:blog_app/presentation/screens/login/login_model.dart';
import 'package:blog_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewmodel extends Bloc<LoginEvent, LoginStates> {
  final Repository repository;
  LoginViewmodel({required this.repository}) : super(LoginInitialState()) {
    on<LoginEvent>(
      (event, emit) async {
        if (event.email.isEmpty && event.password.isEmpty) {
          emit(LoginInvalidState(error: "All fields are mandatory!"));
        } else if (event.email.length <= 5) {
          emit(LoginInvalidState(error: "Please enter a valid email"));
        } else if (event.password.length < 8) {
          emit(LoginInvalidState(error: "Password enter a strong password"));
        } else {
          //main authorised login
          emit(LoginLoadingState());
          try {
           
            LoginModel loginmodel = await repository.loginrepo.postlogin(
                email: event.email.toString(),
                password: event.password.toString());

            if (loginmodel.access_token != null ||
                loginmodel.token_type == "Bearer") {
              Utils.savetoken(token: loginmodel.access_token.toString());
            

              emit(LoginAuthorisedState());
            } else {
            
              emit(LoginUnauthorisedState(errormessage: "Unauthorised User!"));
            }
          } catch (e) {
           
           
            emit(LoginUnauthorisedState(
                errormessage: "Unauthorised Login Attempt!"));
          }
        }
      },
    );
  }
}
