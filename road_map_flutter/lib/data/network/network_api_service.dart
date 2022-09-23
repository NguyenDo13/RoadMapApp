import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:road_map_flutter/data/app_exception.dart';
import 'package:road_map_flutter/data/network/base_api_service.dart';

class NetworkApiService extends BaseApiServices {
  @override
  Future getPostApiResponse(String url, dynamic data, dynamic headers) async {
    dynamic responseJson;
    try {
      final response =
          await http.post(Uri.parse(url), body: data, headers: headers).timeout(
                const Duration(seconds: 10),
              );
      responseJson = returnResponse(response);
    } on SocketException {
      log("No Internet Connection");
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        final responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        log("error 400: ${response.body}");
        throw BadRequestException(
          response.body.toString(),
        );
      case 404:
      case 500:
        log("error 404 || 500: ${response.body}");
        throw UnauthorisedException(
          response.body.toString(),
        );
      default:
        log("lỗi không tìm thấy dữ liệu");
        throw FetchDataException(
          'Lỗi xảy ra khi đang giao tiếp với server với trạng thái code:${response.statusCode}',
        );
    }
  }
}
