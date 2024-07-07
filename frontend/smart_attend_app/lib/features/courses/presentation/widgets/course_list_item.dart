import 'package:flutter/material.dart';
import 'package:smart_attend_app/features/courses/domain/entity/course.dart';

class CourseListItem extends StatelessWidget {
  final Course course;
  final void Function(Course course) onItemClick;

  const CourseListItem({
    super.key,
    required this.course,
    required this.onItemClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onItemClick(course);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 14,
        ),
        decoration: BoxDecoration(
          color:
              course.isSelected ? const Color(0xFFCDFFCC) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 1,
            color: const Color(0xFF979797),
          ),
        ),
        child: Row(
          children: [
            Text(
              course.code,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xFF272A2E),
                height: 1.5,
              ),
            ),
            course.isSelected
                ? Container(
                    margin: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: Image.asset(
                      'assets/images/tick.png',
                      width: 20,
                    ),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
