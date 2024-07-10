import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraProvider with ChangeNotifier {
  // Total time for the timer (in seconds)
  final int totalTime = 15;

  // State variables
  bool isLoading = true;
  int secondsLeft = 15;

  CameraController? controller;
  late List<CameraDescription> cameras;

  Timer? _timer;

  // Method to initialize the camera
  Future<void> initializeCamera() async {
    isLoading = true;

    // Add a short delay
    await Future.delayed(const Duration(milliseconds: 100));

    // Get the list of available cameras
    cameras = await availableCameras();

    // Initialize the camera controller with the second camera (typically the front camera)
    controller = CameraController(
      cameras[1],
      ResolutionPreset.max,
    );

    // Wait for the controller to initialize
    await controller!.initialize();

    // Notify listeners that the camera is initialized
    notifyListeners();

    isLoading = false;
  }

  // Method to start the timer
  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      // Decrease the remaining time and notify listeners
      if (secondsLeft > 0) {
        secondsLeft--;
        notifyListeners();
      } else {
        // Cancel the timer when time is up
        _timer?.cancel();
      }
    });
  }

  // Method to dispose of the camera controller
  void disposeCamera() {
    controller?.dispose();
    controller = null;
  }

  @override
  void dispose() {
    super.dispose();
    // Dispose of the camera and timer when the provider is disposed
    disposeCamera();
    _timer?.cancel();
  }
}
