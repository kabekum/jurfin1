import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ChatScreen extends StatefulWidget {
  final String caseId;
  const ChatScreen({super.key, required this.caseId});
  @override State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late WebSocketChannel channel;
  final _ctrl = TextEditingController();
  final List<String> _messages = [];

  @override void initState() {
    super.initState();
    channel = WebSocketChannel.connect(Uri.parse('ws://localhost:8000/ws/chat/${widget.caseId}/'));
    channel.stream.listen((event) {
      setState(() => _messages.add(event.toString()));
    });
  }

  @override void dispose() {
    channel.sink.close();
    super.dispose();
  }

  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat - Case ${widget.caseId}')),
      body: Column(children: [
        Expanded(child: ListView.builder(itemCount: _messages.length, itemBuilder: (_,i) => ListTile(title: Text(_messages[i])))),
        Padding(padding: const EdgeInsets.all(8.0), child: Row(children: [
          Expanded(child: TextField(controller: _ctrl)),
          IconButton(icon: const Icon(Icons.send), onPressed: () {
            final msg = _ctrl.text.trim();
            if (msg.isNotEmpty) {
              channel.sink.add('{"message":"$msg","user":"demo_user"}');
              _ctrl.clear();
            }
          })
        ]))
      ]),
    );
  }
}
