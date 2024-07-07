import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String getFormattedDate(DateTime date) {
  return DateFormat('dd MMMM yyyy').format(date);
}

String getDay(DateTime date) {
  return DateFormat.EEEE().format(date);
}

String getFormattedAttendanceStatus(String status) {
  switch (status) {
    case 'present':
      return 'Present';
    case 'absent':
      return 'Absent';
    default:
      return status;
  }
}

Color getBackgroundColor(String status) {
  switch (status) {
    case 'present':
      return const Color(0xFFCDFFCC);
    case 'absent':
      return const Color(0xFFFFE3E3);
    default:
      return Colors.transparent;
  }
}
