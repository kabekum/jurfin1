// chatpage.dart

import 'package:flutter/material.dart';
import '../../services/websocket_service.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final ws = WebSocketService();
  final ctrl = TextEditingController();
  final messages = <String>[];

  @override
  void initState() {
    super.initState();

    // Connect to your server
    ws.connect("ws://YOUR_SERVER/ws/chat/CASE_ID/");

    ws.stream.listen((msg) {
      setState(() => messages.add(msg));
    });
  }

  @override
  void dispose() {
    ws.close();
    super.dispose();
  }

  void send() {
    if (ctrl.text.isNotEmpty) {
      ws.send(ctrl.text);
      ctrl.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chat")),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: messages
                  .map((m) => ListTile(title: Text(m)))
                  .toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(child: TextField(controller: ctrl)),
                IconButton(icon: const Icon(Icons.send), onPressed: send),
              ],
            ),
          )
        ],
      ),
    );
  }
}
