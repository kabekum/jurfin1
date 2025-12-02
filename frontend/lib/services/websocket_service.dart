import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:stream_transform/stream_transform.dart';

class WebSocketService {
  WebSocketChannel? _channel;

  void connectToCase(String baseWsUrl, String caseId) {
    final url = Uri.parse('\$baseWsUrl/ws/chat/\$caseId/');
    _channel = WebSocketChannel.connect(url);
  }

  Stream<Map<String, dynamic>> messages() {
    return _channel!.stream.map((e) => jsonDecode(e as String) as Map<String, dynamic>);
  }

  void send(String message, String user) {
    final payload = jsonEncode({'message': message, 'user': user});
    _channel?.sink.add(payload);
  }

  void close() {
    _channel?.sink.close();
    _channel = null;
  }
}