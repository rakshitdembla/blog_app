import 'package:blog_app/data/repositories/repository.dart';
import 'package:blog_app/presentation/screens/register/bloc/register_states.dart';
import 'package:blog_app/presentation/screens/register/bloc/registerevents.dart';
import 'package:blog_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../registermodel.dart';

class RegisterViewmodel extends Bloc<RegisterEvents, RegisterStates> {
  final Repository repository;
  RegisterViewmodel({required this.repository})
      : super(RegisterInitialState()) {
    on<RegisterSubmit>(
      (event, emit) async {
       
        if (event.email.isEmpty ||
            event.name.isEmpty ||
            event.password.isEmpty) {
          emit(RegisterInvalidState(error: "All fields are mandatory!"));
        } else if (event.email.length <= 5) {
          emit(RegisterInvalidState(error: "Please enter a valid email"));
        } else if (event.password.length < 8) {
          emit(RegisterInvalidState(error: "Password enter a strong password"));
        } else if (event.name.length <= 3) {
          emit(RegisterInvalidState(error: "Please enter a valid full name"));
        } else {
          //main authorised Register
          emit(RegisterLoadingState());
          try {
          
            RegisterModel Registermodel = await repository.registerRepo
                .postRegister(
                    email: event.email.toString(),
                    password: event.password.toString(),
                    name: event.name.toString());

            if (Registermodel.accessToken != null ||
                Registermodel.tokenType == "Bearer" ||
                Registermodel.data != null) {
              Utils.savetoken(token: Registermodel.accessToken.toString());
             

              emit(RegisterAuthorisedState());
            } else {
             
              emit(RegisterUnauthorisedState(
                  errormessage: "An error occured or user already exists!"));
            }
          } catch (e) {
           
            emit(RegisterUnauthorisedState(
                errormessage: "An error occured or user already exists!"));
          }
        }
      },
    );
  }
}
