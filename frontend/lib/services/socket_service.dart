import 'package:web_socket_channel/web_socket_channel.dart';

class SocketService {
  WebSocketChannel? channel;

  void connectToCase(String caseId) {
    final url = Uri.parse('ws://localhost:8000/ws/chat/$caseId/'); // change domain in prod
    channel = WebSocketChannel.connect(url);
  }

  void send(String message, String user) {
    channel?.sink.add('{"message":"$message","user":"$user"}');
  }

  void close() {
    channel?.sink.close();
  }
}
