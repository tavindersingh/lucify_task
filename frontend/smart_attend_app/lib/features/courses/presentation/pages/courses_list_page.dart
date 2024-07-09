import 'package:flutter/material.dart';
import 'package:smart_attend_app/common/helpers/sample_data.dart';
import 'package:smart_attend_app/common/router/route_transition.dart';
import 'package:smart_attend_app/common/widgets/footer.dart';
import 'package:smart_attend_app/common/widgets/my_app_bar.dart';
import 'package:smart_attend_app/features/attendance/presentation/pages/attendance_detail_page.dart';
import 'package:smart_attend_app/features/courses/presentation/widgets/course_list_item.dart';

class CoursesListPage extends StatefulWidget {
  const CoursesListPage({super.key});

  @override
  State<CoursesListPage> createState() => _CoursesListPageState();
}

class _CoursesListPageState extends State<CoursesListPage>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _slideAnimation;
  late Animation<double> _listOpacityAnimation;
  late Animation<double> _listFullOpacityAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<double> _bottomButtonSlideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _slideAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 500.0,
          end: 180.0,
        ).chain(
          CurveTween(
            curve: Curves.easeIn,
          ),
        ),
        weight: 1.0,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 180.0,
          end: 0,
        ).chain(
          CurveTween(
            curve: Curves.easeOut,
          ),
        ),
        weight: 1.0,
      ),
    ]).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 1.0),
      ),
    );

    _opacityAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(
          begin: 0.0,
          end: 0.1,
        ).chain(
          CurveTween(
            curve: Curves.easeIn,
          ),
        ),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 0.1,
          end: 1.0,
        ).chain(
          CurveTween(
            curve: Curves.easeOut,
          ),
        ),
        weight: 1,
      ),
    ]).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 1.0),
      ),
    );

    _bottomButtonSlideAnimation = Tween(
      begin: 400.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    _listOpacityAnimation = Tween(
      begin: 0.0,
      end: 0.3,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0,
          0.5,
          curve: Curves.easeIn,
        ),
      ),
    );

    _listFullOpacityAnimation = Tween(
      begin: 0.0,
      end: 0.7,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.5,
          1.0,
          curve: Curves.easeOut,
        ),
      ),
    );

    Future.delayed(const Duration(milliseconds: 1), () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Opacity(
                  opacity: _opacityAnimation.value,
                  child: const MyAppBar(),
                );
              },
            ),
            const SizedBox(
              height: 84,
            ),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Opacity(
                  opacity: _opacityAnimation.value,
                  child: const Text(
                    'Courses List',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(
                    _slideAnimation.value,
                    0,
                  ),
                  child: Opacity(
                    opacity: _listOpacityAnimation.value +
                        _listFullOpacityAnimation.value,
                    child: Column(
                      children: SampleData.courses
                          .map(
                            (course) => Column(
                              children: [
                                CourseListItem(
                                  course: course,
                                  onItemClick: (course) {
                                    // Navigator.of(context).push(
                                    //     MaterialPageRoute(
                                    //         builder: (_) =>
                                    //             const AttendanceDetailPage()));
                                    Navigator.of(context).push(createFadeRoute(
                                        const AttendanceDetailPage()));
                                  },
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ),
                );
              },
            ),
            const Spacer(),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(
                    0,
                    _bottomButtonSlideAnimation.value,
                  ),
                  child: Hero(
                    tag: 'markAttendanceButton',
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Mark Attendance'),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 44,
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
