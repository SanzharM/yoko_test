import 'dart:convert';

import 'package:yoko_test/core/api/api.dart';
import 'package:yoko_test/core/api/api_endpoints.dart';
import 'package:yoko_test/main/data/providers/app_provider.dart';
import 'package:yoko_test/main/data/providers/authorization/authorization_response.dart';

class AuthorizationProvider extends AppProvider {
  Future<LoginResponse> login(String login, String password) async {
    final response = await api.request(
      route: Uri.parse(ApiEndpoints.host + ApiEndpoints.login),
      method: Method.post,
      params: jsonEncode({"email": login, "password": password}),
    );

    if (response.isSuccess && (response.response?.body.isNotEmpty ?? false)) {
      final rawData = jsonDecode(response.response!.body);
      await storage.setAccessToken(rawData['accessToken']);
    }

    return LoginResponse(
      isSuccess: response.isSuccess,
      statusCode: response.statusCode,
      response: response.response,
      error: response.error,
    );
  }
}
