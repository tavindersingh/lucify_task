import 'package:smart_attend_app/features/courses/domain/entity/course.dart';

class SampleData {
  static List<Course> courses = [
    Course(id: '1', code: 'MTL 100'),
    Course(id: '2', code: 'PYL 100'),
    Course(id: '3', code: 'CML 100'),
    Course(id: '4', code: 'APL 100', isSelected: true),
    Course(id: '5', code: 'NEN 100'),
  ];
}
