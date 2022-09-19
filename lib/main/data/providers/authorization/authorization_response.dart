import 'package:http/http.dart';
import 'package:yoko_test/core/api/api_response.dart';

class LoginResponse extends ApiResponse {
  const LoginResponse({
    bool isSuccess = false,
    int? statusCode,
    String? error,
    Response? response,
  }) : super(isSuccess: isSuccess, statusCode: statusCode, error: error, response: response);
}
