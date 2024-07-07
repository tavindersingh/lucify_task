import 'package:flutter/material.dart';
import 'package:smart_attend_app/common/helpers/helper_functions.dart';
import 'package:smart_attend_app/common/helpers/sample_data.dart';

class AttendanceHistoryTable extends StatelessWidget {
  const AttendanceHistoryTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: const TableBorder(
        horizontalInside: BorderSide(
          width: 4,
          color: Colors.white,
        ),
      ),
      children: [
        TableRow(
          decoration: const BoxDecoration(
            color: Color(0xFFE1E1E1),
          ),
          children: [
            TableCell(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: const Text(
                  'Date',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            TableCell(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: const Text(
                  'Day',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            TableCell(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: const Text(
                  'Attendance',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        ...SampleData.attendanceList.map(
          (attendance) => TableRow(
            decoration: BoxDecoration(
              color: getBackgroundColor(attendance.status),
            ),
            children: [
              TableCell(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 6,
                  ),
                  child: Text(
                    getFormattedDate(attendance.date),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF272A2E),
                    ),
                  ),
                ),
              ),
              TableCell(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 6,
                  ),
                  child: Text(
                    getDay(attendance.date),
                  ),
                ),
              ),
              TableCell(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 6,
                  ),
                  child: Text(
                    getFormattedAttendanceStatus(attendance.status),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
