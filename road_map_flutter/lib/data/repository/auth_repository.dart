// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:road_map_flutter/data/environment.dart';
import 'package:road_map_flutter/data/interfaces/i_service_api.dart';
import 'package:road_map_flutter/data/models/auth_user.dart';
import 'package:road_map_flutter/data/response/base_response.dart';

import '../network/base_api_service.dart';
import '../network/network_api_service.dart';

class AuthRepository extends IServiceAPI {
  String urlEndPointLogin = "auth/login";
  final BaseApiServices apiServices = NetworkApiService();
  late Environment environment;
  AuthRepository({required Environment e}) {
    environment = e;
    urlEndPointLogin = environment.baseURL + urlEndPointLogin;
  }

  @override
  List convertDynamicToList({required BaseResponse value}) {
    throw UnimplementedError();
  }

  @override
  AuthUser convertDynamicToObject(value) {
    return AuthUser.fromJson(value);
  }

  @override
  Future getData({required data}) async {
    try {
      final response = await apiServices.getPostApiResponse(
        urlEndPointLogin,
        data,
        null,
      );
      return response;
    } on Exception catch (_) {
      return null;
    }
  }
}
