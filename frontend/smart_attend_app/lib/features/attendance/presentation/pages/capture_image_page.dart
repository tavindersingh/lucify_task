import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_attend_app/common/router/route_transition.dart';
import 'package:smart_attend_app/common/widgets/footer.dart';
import 'package:smart_attend_app/common/widgets/my_app_bar.dart';
import 'package:smart_attend_app/features/attendance/presentation/pages/verify_attendance_code_page.dart';
import 'package:smart_attend_app/features/attendance/presentation/providers/camera_provider.dart';
import 'package:smart_attend_app/features/attendance/presentation/widgets/camera_widget.dart';

class CaptureImagePage extends StatefulWidget {
  const CaptureImagePage({super.key});

  @override
  State<CaptureImagePage> createState() => _CaptureImagePageState();
}

class _CaptureImagePageState extends State<CaptureImagePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CameraProvider()
        ..initializeCamera()
        ..startTimer(),
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
                  Consumer<CameraProvider>(
                    builder: (context, provider, child) {
                      return Text(
                        'Timer ${provider.secondsLeft} seconds left',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
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
                  Consumer<CameraProvider>(
                    builder: (context, provider, child) {
                      return ElevatedButton(
                        onPressed: () {
                          moveToNextPage(context, provider);
                        },
                        child: const Text('Capture'),
                      );
                    },
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

  void moveToNextPage(
      BuildContext context, CameraProvider cameraProvider) async {
    // final CameraProvider cameraProvider = Provider.of<CameraProvider>(
    //   context,
    //   listen: false,
    // );

    cameraProvider.disposeCamera();

    await Navigator.of(context).push(createLeftSlideRoute(
      const VerifyAttendanceCodePage(),
    ));

    cameraProvider.initializeCamera();
  }
}
