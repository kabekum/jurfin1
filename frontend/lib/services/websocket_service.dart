// websocket_service.dart

import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService {
  WebSocketChannel? _channel;

  /// Connect to websocket server
  void connect(String url) {
    _channel = WebSocketChannel.connect(Uri.parse(url));
  }

  /// Expose raw stream (String messages)
  Stream<String> get stream {
    return _channel!.stream.map((event) => event.toString());
  }

  /// Send a text message
  void send(String message) {
    _channel?.sink.add(message);
  }

  /// Close connection
  void close() {
    _channel?.sink.close();
  }
}
