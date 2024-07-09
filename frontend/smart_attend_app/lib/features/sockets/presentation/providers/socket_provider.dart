import 'package:flutter/material.dart';
import 'package:smart_attend_app/common/services/notification_service.dart';
import 'package:smart_attend_app/features/attendance/data/datasources/web_socket_channel.dart';

class SocketProvider extends ChangeNotifier {
  final WebSocketChannelFactory _webSocketChannelFactory =
      WebSocketChannelFactory.instance;

  void connectToWebsocket() async {
    _webSocketChannelFactory.connect(onConnect: () {
      receiveMessage();
    });
  }

  void sendMessage(String message) {
    _webSocketChannelFactory.webSocketSender(
      'newMessage',
      {
        'message': message,
      },
    );
  }

  void receiveMessage() {
    _webSocketChannelFactory.webSocketReceiver(
      'messageFromServer',
      (data) {
        print(data);

        NotificationService.display(data);
      },
    );
  }
}
