import 'package:fitness_app_flutter/constants/constants.dart';
import 'package:fitness_app_flutter/core/api_base_helper.dart';

class AuthService {
  ApiBaseHelper _helper = new ApiBaseHelper();

  Future<dynamic> login({required Map<String, String> body}) async {
    final response = await _helper.post(LOGIN_EP, body);
    print(response);
    return response['success'] != null;
  }

  Future<bool> register({required Map<String, String> body}) async {
    final response = await _helper.post(SIGNUP_EP, body);
    print(response);
    return response['success'] != null;
  }

  Future<dynamic> activate({required Map<String, String> body}) async {
    final response = await _helper.patch(ACTIVATE_EP, body);
    print(response);
    return response;
  }
}
