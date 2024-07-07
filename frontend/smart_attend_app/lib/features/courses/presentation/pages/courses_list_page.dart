import 'package:flutter/material.dart';
import 'package:smart_attend_app/common/helpers/sample_data.dart';
import 'package:smart_attend_app/common/widgets/my_app_bar.dart';
import 'package:smart_attend_app/features/courses/presentation/widgets/course_list_item.dart';

class CoursesListPage extends StatelessWidget {
  const CoursesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 56,
            ),
            const MyAppBar(),
            const SizedBox(
              height: 84,
            ),
            const Text(
              'Courses List',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ...SampleData.courses.map(
              (course) => Column(
                children: [
                  CourseListItem(
                    course: course,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Mark Attendance'),
            ),
            const SizedBox(
              height: 44,
            ),
          ],
        ),
      ),
    );
  }
}
