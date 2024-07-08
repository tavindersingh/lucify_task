import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraProvider with ChangeNotifier {
  final int totalTime = 15;

  bool isLoading = false;
  int secondsLeft = 15;
  late CameraController controller;
  late List<CameraDescription> _cameras;

  Timer? _timer;

  void initializeCamera() async {
    isLoading = true;

    await Future.delayed(const Duration(
      milliseconds: 100,
    ));
    _cameras = await availableCameras();

    controller = CameraController(
      _cameras[1],
      ResolutionPreset.max,
    );

    await controller.initialize();

    notifyListeners();

    isLoading = false;
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsLeft > 0) {
        secondsLeft--;
        notifyListeners();
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    _timer?.cancel();
  }
}
