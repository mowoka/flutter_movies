import 'package:intl/intl.dart';

String dateFormatter(String date, String format) {
  DateTime dateTime = DateTime.parse(date);
  return DateFormat(format).format(dateTime);
}

String convertDate(DateTime date) {
  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
  return dateFormat.format(date);
}
