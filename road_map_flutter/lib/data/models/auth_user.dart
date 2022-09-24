import 'package:road_map_flutter/data/models/user.dart';

class AuthUser {
  String? accessToken;
  User? user;

  AuthUser({this.accessToken, this.user});

  AuthUser.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
}
