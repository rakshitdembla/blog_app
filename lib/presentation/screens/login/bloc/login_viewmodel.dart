import 'package:blog_app/data/repositories/repository.dart';
import 'package:blog_app/presentation/screens/login/bloc/login_events.dart';
import 'package:blog_app/presentation/screens/login/bloc/login_states.dart';
import 'package:blog_app/presentation/screens/login/login_model.dart';
import 'package:blog_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewmodel extends Bloc<LoginEvents, LoginStates> {
  final Repository repository;
  LoginViewmodel({required this.repository}) : super(LoginInitialState()) {
    on<emailchangeEvent>((event, emit) {
      final emailRegex =
          RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");

      if (emailRegex.hasMatch(event.email.toString())) {
        emit(ValidEmailState());
      } else {
        emit(InvalidEmailState(
            invalidMsg: "Please enter a valid email address!"));
      }
    });

    //password value check event

    on<passchangeEvent>(
      (event, emit) {
        if (event.pass.toString().length >= 8) {
          emit(ValidPasswordState());
        } else {
          emit(InvalidPasswordState(
              invalidMsg: "Password's minimum length should be 8!"));
        }
      },
    );

    //login event

    on<loginEvent>(
      (event, emit) async {
        emit(LoadingState());
        
        try {
          LoginModel loginmodel = await repository.loginrepo
              .postlogin(email: event.email, password: event.password);
          Utils.savetoken(token: loginmodel.access_token.toString());

          emit(LoggingInState(message: "Logging in! Please wait..."));
        } catch (e) {
          emit(unauthorizedState(message: e.toString()));
        }
      },
    );
  }
}
