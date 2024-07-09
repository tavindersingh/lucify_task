import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_attend_app/features/sockets/presentation/providers/socket_provider.dart';

class AttendanceProvider extends ChangeNotifier {
  void sendMessage(BuildContext context, String message) {
    Provider.of<SocketProvider>(
      context,
      listen: false,
    ).sendMessage(message);
  }
}
