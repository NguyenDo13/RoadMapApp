// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:road_map_flutter/data/models/user.dart';

class AuthUser {
  String? accessToken;
  User? user;

  AuthUser({
    this.accessToken,
    this.user,
  });

  AuthUser.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }



  @override
  String toString() => 'AuthUser(accessToken: $accessToken, user: $user)';

  @override
  bool operator ==(covariant AuthUser other) {
    if (identical(this, other)) return true;
  
    return 
      other.accessToken == accessToken &&
      other.user == user;
  }

  @override
  int get hashCode => accessToken.hashCode ^ user.hashCode;
}
