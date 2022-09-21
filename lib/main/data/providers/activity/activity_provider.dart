import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:yoko_test/core/api/api.dart';
import 'package:yoko_test/core/api/api_endpoints.dart';
import 'package:yoko_test/main/data/providers/app_provider.dart';
import 'package:yoko_test/main/domain/models/activity.dart';

import 'activity_response.dart';

class ActivityProvider extends AppProvider {
  Future<ActivityResponse> getActivities() async {
    final response = await api.request(
      route: Uri.parse(ApiEndpoints.host + ApiEndpoints.activities),
      method: Method.get,
      needToken: true,
    );

    return ActivityResponse(
      isSuccess: response.isSuccess,
      statusCode: response.statusCode,
      response: response.response,
      activities: response.isSuccess ? await compute(_parseActivities, response.response?.bodyBytes) : null,
      error: response.isSuccess ? null : response.error,
    );
  }

  List<Activity>? _parseActivities(Uint8List? bodyBytes) {
    if (bodyBytes?.isEmpty ?? true) return null;
    try {
      final rawJson = jsonDecode(utf8.decode(bodyBytes!)) as List?;
      return rawJson?.map((e) => Activity.fromMap(e)).toList();
    } catch (e) {
      debugPrint('Unable to parse Activities: $e');
      return null;
    }
  }
}
