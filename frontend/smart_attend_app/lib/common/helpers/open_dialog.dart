import 'package:flutter/material.dart';

Future<void> openDialog({
  required BuildContext context,
  required Widget content,
}) async {
  await showGeneralDialog(
    context: context,
    pageBuilder: (context, animation, secondaryAnimation) {
      return Container();
    },
    transitionDuration: const Duration(milliseconds: 200),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      final curvedValue = Curves.easeInOut.transform(animation.value) - 1.0;
      return Transform(
        transform: Matrix4.translationValues(0.0, curvedValue * -500, 0.0),
        child: Dialog(
          backgroundColor: Colors.white,
          insetPadding: EdgeInsets.zero,
          child: content,
        ),
      );
    },
  );
}
