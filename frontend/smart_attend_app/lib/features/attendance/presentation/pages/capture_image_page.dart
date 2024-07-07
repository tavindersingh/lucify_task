import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_attend_app/common/widgets/footer.dart';
import 'package:smart_attend_app/common/widgets/my_app_bar.dart';
import 'package:smart_attend_app/features/attendance/presentation/pages/verify_attendance_code_page.dart';
import 'package:smart_attend_app/features/attendance/presentation/providers/camera_provider.dart';
import 'package:smart_attend_app/features/attendance/presentation/widgets/camera_widget.dart';

class CaptureImagePage extends StatelessWidget {
  const CaptureImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CameraProvider()..initializeCamera(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(
                height: 56,
              ),
              const MyAppBar(),
              const SizedBox(
                height: 28,
              ),
              const Expanded(
                child: CameraWidget(),
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  const Text(
                    'Timer 15 seconds left',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Keep your App in foreground',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFFE43E3A),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      moveToNextPage(context);
                    },
                    child: const Text('Capture'),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Footer(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void moveToNextPage(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => const VerifyAttendanceCodePage()));
  }
}
