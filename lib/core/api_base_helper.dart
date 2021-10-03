import 'dart:convert';
import 'dart:io';
import 'package:fitness_app_flutter/core/app_exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:fitness_app_flutter/constants/constants.dart';

class ApiBaseHelper {
  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response = await http.get(Uri.parse(BASE_URL + url));
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
