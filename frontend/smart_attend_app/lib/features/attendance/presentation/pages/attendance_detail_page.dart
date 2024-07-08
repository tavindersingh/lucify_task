import 'package:flutter/material.dart';
import 'package:smart_attend_app/common/widgets/my_app_bar.dart';
import 'package:smart_attend_app/common/widgets/title.dart';
import 'package:smart_attend_app/features/attendance/presentation/pages/capture_image_page.dart';
import 'package:smart_attend_app/features/attendance/presentation/widgets/attendance_history_table.dart';

class AttendanceDetailPage extends StatelessWidget {
  const AttendanceDetailPage({super.key});

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
              height: 24,
            ),
            const AppTitle(
              text: 'MTL 100',
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/location.png',
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    const Text(
                      'LH 121',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/images/clock.png',
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    const Text(
                      '11:00 AM',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 36,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => const CaptureImagePage(),
                ));
              },
              child: const Text('Mark Attendance'),
            ),
            const SizedBox(
              height: 58,
            ),
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'Attendance history\nand statistics',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: const Color(0xFF272A2E),
                      width: 1,
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: '30',
                      isDense: true,
                      items: const [
                        DropdownMenuItem(
                          value: '10',
                          child: Text(
                            'Last 10 days',
                          ),
                        ),
                        DropdownMenuItem(
                          value: '30',
                          child: Text(
                            'Last 30 days',
                          ),
                        ),
                      ],
                      onChanged: (value) {},
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 48,
            ),
            const AttendanceHistoryTable(),
          ],
        ),
      ),
    );
  }
}