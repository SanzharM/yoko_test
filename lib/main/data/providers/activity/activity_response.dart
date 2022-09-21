import 'package:http/http.dart';
import 'package:yoko_test/core/api/api_response.dart';
import 'package:yoko_test/main/domain/models/activity.dart';

class ActivityResponse extends ApiResponse {
  final List<Activity>? activities;
  const ActivityResponse({
    this.activities,
    bool isSuccess = false,
    int? statusCode,
    String? error,
    Response? response,
  }) : super(isSuccess: isSuccess, statusCode: statusCode, error: error, response: response);
}
