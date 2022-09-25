// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:road_map_flutter/data/repository/auth_repository.dart';
import 'package:road_map_flutter/presentation/services/login_bloc/login_event.dart';
import 'package:road_map_flutter/presentation/services/login_bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  late final AuthRepository authRepository;
  late final Future<SharedPreferences> sharedPreferences;

  LoginBloc(
    this.authRepository,
    this.sharedPreferences,
  ) : super(LoginInitial()) {
    on<SimplyLoginEvent>((event, emit) async {
      final value = await authRepository.getData(
        data: {'username': event.email, 'password': event.password},
      );

      if (value != null) {
        final authUser = authRepository.convertDynamicToObject(value);
        final shared = await sharedPreferences;
        shared.setString('auth_token', authUser.accessToken.toString());

        emit(LoggedState(authUser));
      } else {
        emit(LoginInitial());
      }
    });

    on<LoginWithAccessToken>((event, emit) async {
      final shared = await sharedPreferences;
      final tokenUser = shared.getString('auth_token');
      log(tokenUser.toString());
      if (tokenUser != null) {
        final value = await authRepository.getDataLoginToken(
          data: {
            'accessToken': tokenUser,
          },
        );
        if (value != null) {
          final authUser = authRepository.convertDynamicToObject(value);
          emit(LoggedState(authUser));
        } else {
          emit(LoginInitial());
        }
      } else {
        emit(LoginInitial());
      }
    });
    on<LoginGoogleEvent>((event, emit) {});
    on<LoginFacebookEvent>((event, emit) {});
    on<LogoutEvent>((event, emit) {
      emit(LoginInitial());
    });
  }
}
