import 'package:intl/intl.dart';

String castDateTime({required DateTime dateTime}) {
  final format = DateFormat.yMEd().add_jms().format(dateTime);

  return format;
}
