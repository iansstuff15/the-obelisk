import 'package:intl/intl.dart';
import 'package:the_obelisk/core/constants/appConstants.dart';

class DateUtil {
  static String formatDateTime({required String dateTime}) {
    return DateFormat(dateTime).format(now);
  }
}
