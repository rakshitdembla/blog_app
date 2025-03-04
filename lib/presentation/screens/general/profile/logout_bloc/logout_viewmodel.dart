import 'package:blog_app/data/repositories/repository.dart';
import 'package:blog_app/presentation/screens/general/profile/logout_bloc/logout_events.dart';
import 'package:blog_app/presentation/screens/general/profile/logout_bloc/logout_states.dart';
import 'package:blog_app/presentation/screens/login/bloc/login_states.dart';
import 'package:blog_app/presentation/screens/login/bloc/login_viewmodel.dart';
import 'package:blog_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogoutViewmodel extends Bloc<LogoutEvent, LogoutStates> {
  Repository repository;
  LogoutViewmodel({required this.repository}) : super(LogoutInitialState()) {
    on<LogoutEvent>(
      (event, emit) async {
        emit(LogoutLoadingState(message: "Logging out..."));
        try {
          var logoutdata = repository.logoutRepo.postlogout();

          Utils.clearPrefs();
          var checktoken = Utils.gettoken();
          if (checktoken == null) {
            emit(LogoutLoggingout(message: "Logged out!"));
          } else {
            emit(LogoutFailed(message: "An Error Occured!"));
          }

          //debugPrint("🎈======Prefs clear + Logged Out ======🎈");
        } catch (e) {
          emit(LogoutFailed(message: "An Error Occured!"));
        }
      },
    );
  }
}
