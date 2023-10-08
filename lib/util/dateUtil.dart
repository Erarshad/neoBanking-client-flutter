 import 'package:intl/intl.dart';

String formattedTime(DateTime? dateTime) {
    return DateFormat('hh:mm a').format(dateTime??DateTime.now());
  }