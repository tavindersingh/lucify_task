import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/camera_provider.dart';

class CameraWidget extends StatefulWidget {
  const CameraWidget({super.key});

  @override
  State<CameraWidget> createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  @override
  Widget build(BuildContext context) {
    // Get the screen width to set the camera preview width
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            offset: const Offset(-1.77, 1.77),
            blurRadius: 5.48,
            color: const Color(0xFFC02A2A).withOpacity(0.15),
          ),
          BoxShadow(
            offset: const Offset(-7.24, 6.71),
            blurRadius: 9.89,
            color: const Color(0xFFC02A2A).withOpacity(0.13),
          ),
        ],
      ),
      // Use Consumer to listen to changes in CameraProvider
      child: Consumer<CameraProvider>(
        builder: (context, cameraProvider, child) {
          // Show a loading indicator if the camera is still loading
          if (cameraProvider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // Show an empty box if the camera is not initialized
          if (cameraProvider.controller == null ||
              !cameraProvider.controller!.value.isInitialized) {
            return const SizedBox();
          }

          // Show the camera preview and additional UI elements
          return Stack(
            fit: StackFit.expand,
            children: [
              // Display the camera preview
              SizedBox(
                width: screenWidth,
                child: CameraPreview(cameraProvider.controller!),
              ),
              // Display an overlay image at the center
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 250,
                  height: 344,
                  child: Image.asset('assets/images/oval.png'),
                ),
              ),
              // Display a progress bar at the bottom
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  width: 348,
                  height: 44,
                  color: Colors.black.withOpacity(0.2),
                  padding: const EdgeInsets.symmetric(horizontal: 38),
                  child: Center(
                    // Use another Consumer to listen to changes in CameraProvider
                    child: Consumer<CameraProvider>(
                        builder: (context, provider, child) {
                      return LinearProgressIndicator(
                        // Calculate the progress value based on the remaining time
                        value: 1.0 -
                            (provider.secondsLeft * 1.0) / provider.totalTime,
                        minHeight: 10,
                        borderRadius: BorderRadius.circular(20),
                        backgroundColor: const Color(0xFFECECEC),
                        color: const Color(0xFFE43E3A),
                      );
                    }),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
