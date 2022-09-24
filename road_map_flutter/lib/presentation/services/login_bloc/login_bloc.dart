// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:road_map_flutter/data/repository/auth_repository.dart';
import 'package:road_map_flutter/presentation/services/login_bloc/login_event.dart';
import 'package:road_map_flutter/presentation/services/login_bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  late final AuthRepository authRepository;
  LoginBloc(
    this.authRepository,
  ) : super(LoginInitial()) {
    on<SimplyLoginEvent>((event, emit) async {
      emit(LoginInitial());
      final value = await authRepository.getData(
        data: {'username': event.email, "password": event.password},
      );
      
      if (value != null) {
        final authUser = authRepository.convertDynamicToObject(value);
        log(authUser.accessToken.toString());
        emit(LoggedState(authUser));
      } else {
        log('fail!');
        emit(LoginInitial());
      }
    });
    on<LoginGoogleEvent>((event, emit) {});
    on<LoginFacebookEvent>((event, emit) {});
    on<LogoutEvent>((event, emit) {
      emit(LogoutState());
    });
  }
}
