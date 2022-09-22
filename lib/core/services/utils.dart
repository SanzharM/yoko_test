import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class Utils {
  static DateTime? parseDate(dynamic date, {String format = 'yyyy-MM-dd HH:mm:ss'}) {
    try {
      return DateFormat(format).parse('$date');
    } catch (e) {
      debugPrint('Unable to parse date ($date): $e');
      return null;
    }
  }

  static String formatPrice(dynamic price, {String? currency}) {
    if (price == null) return '';
    return '$price ${currency ?? 'KZT'}';
  }
}
