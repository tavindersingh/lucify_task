import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationService {
  NotificationService();

  static final _localNotifications = FlutterLocalNotificationsPlugin();

  static requestNotificationPermission() async {
    bool isGranted = await Permission.notification.isGranted;

    if (!isGranted) {
      await Permission.notification.request();
    }
  }

  static void initialize() {
    // Initialization  setting for android
    const InitializationSettings initializationSettingsAndroid =
        InitializationSettings(
      android: AndroidInitializationSettings(
        "@mipmap/ic_launcher",
      ),
    );

    _localNotifications.initialize(
      initializationSettingsAndroid,
      // to handle event when we receive notification
      onDidReceiveNotificationResponse: (details) {
        if (details.input != null) {}
      },
    );
  }

  static Future<void> display(message) async {
    // To display the notification in device
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      NotificationDetails notificationDetails = const NotificationDetails(
        android: AndroidNotificationDetails(
          "Channel Id",
          "Main Channel",
          groupKey: "key",
          color: Colors.green,
          importance: Importance.max,
          // different sound for
          // different notification
          playSound: true,
          priority: Priority.high,
        ),
      );
      await _localNotifications.show(
        id,
        message['title'],
        message['body'],
        notificationDetails,
      );
    } catch (e, stacktrace) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: stacktrace);
    }
  }
}
