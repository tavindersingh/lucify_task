import 'package:smart_attend_app/features/attendance/domain/entities/attendance.dart';
import 'package:smart_attend_app/features/courses/domain/entity/course.dart';

class SampleData {
  static List<Course> courses = [
    Course(id: '1', code: 'MTL 100'),
    Course(id: '2', code: 'PYL 100'),
    Course(id: '3', code: 'CML 100'),
    Course(id: '4', code: 'APL 100', isSelected: true),
    Course(id: '5', code: 'NEN 100'),
  ];

  static List<Attendance> attendanceList = [
    Attendance(
      date: DateTime(2024, 06, 12),
      status: 'present',
    ),
    Attendance(
      date: DateTime(2024, 06, 13),
      status: 'present',
    ),
    Attendance(
      date: DateTime(2024, 06, 14),
      status: 'absent',
    ),
    Attendance(
      date: DateTime(2024, 06, 15),
      status: 'present',
    ),
    Attendance(
      date: DateTime(2024, 06, 16),
      status: 'absent',
    ),
    Attendance(
      date: DateTime(2024, 06, 17),
      status: 'present',
    ),
  ];
}
