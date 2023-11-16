import 'package:intl/intl.dart';

String dateFormatter(String date, String format) {
  DateTime dateTime = DateTime.parse(date);
  return DateFormat(format).format(dateTime);
}
