import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraProvider with ChangeNotifier {
  final int totalTime = 15;

  bool isLoading = true;
  int secondsLeft = 15;

  CameraController? controller;
  late List<CameraDescription> cameras;

  Timer? _timer;

  Future<void> initializeCamera() async {
    isLoading = true;

    await Future.delayed(const Duration(
      milliseconds: 100,
    ));
    cameras = await availableCameras();

    controller = CameraController(
      cameras[1],
      ResolutionPreset.max,
    );

    await controller!.initialize();

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

  void disposeCamera() {
    controller?.dispose();
    controller = null;
  }

  @override
  void dispose() {
    super.dispose();
    disposeCamera();
    _timer?.cancel();
  }
}
