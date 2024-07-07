import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraProvider with ChangeNotifier {
  bool isLoading = false;
  late CameraController controller;
  late List<CameraDescription> _cameras;

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

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}
