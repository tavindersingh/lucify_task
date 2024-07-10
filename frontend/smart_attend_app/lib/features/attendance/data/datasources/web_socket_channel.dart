import 'package:flutter/foundation.dart';
import 'package:smart_attend_app/common/helpers/app_constants.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class WebSocketChannelFactory {
  static final WebSocketChannelFactory instance = WebSocketChannelFactory();

  String _fetchBaseUrl() {
    return AppConstants.serverUrl;
  }

  io.Socket get socket => io.io(
      _fetchBaseUrl(), io.OptionBuilder().setTransports(['websocket']).build());

  Future<void> connect({required VoidCallback onConnect}) async {
    try {
      socket.connect();

      socket.onConnect((_) {
        debugPrint("Websocket connection success");
        onConnect();
      });
    } catch (e) {
      debugPrint('$e');
    }
  }

  void webSocketReceiver(String eventName, Function(dynamic data) onEvent) {
    socket.on(eventName, (data) {
      onEvent(data);
    });
  }

  void webSocketSender(String eventName, dynamic body) {
    socket.emit(eventName, body);
  }
}
