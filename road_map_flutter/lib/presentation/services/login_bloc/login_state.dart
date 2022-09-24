import 'package:road_map_flutter/data/models/auth_user.dart';

abstract class LoginState{
  const LoginState();
}

class LoginInitial extends LoginState {}
class LoggedState extends LoginState {
  LoggedState(AuthUser authUser);
}
class LogoutState extends LoginState {}
