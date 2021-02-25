import 'package:date_format/date_format.dart';

String dateFormat(DateTime time) {
  return formatDate(time, ['d', '/', 'M', '/', 'yy']);
}
