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
      child: Consumer<CameraProvider>(
        builder: (context, cameraProvider, child) {
          if (cameraProvider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (cameraProvider.controller == null ||
              !cameraProvider.controller!.value.isInitialized) {
            return const SizedBox();
          }
          return Stack(
            fit: StackFit.expand,
            children: [
              SizedBox(
                width: screenWidth,
                child: CameraPreview(cameraProvider.controller!),
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 250,
                  height: 344,
                  child: Image.asset('assets/images/oval.png'),
                ),
              ),
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
                    child: Consumer<CameraProvider>(
                        builder: (context, provider, child) {
                      return LinearProgressIndicator(
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
              )
            ],
          );
        },
      ),
    );
  }
}
