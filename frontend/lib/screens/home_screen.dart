import 'package:flutter/material.dart';
import 'chat_screen.dart';
import 'invoices_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Jura Dashboard')),
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const InvoicesScreen())), child: const Text('Invoices')),
          const SizedBox(height: 12),
          ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ChatScreen(caseId: '1'))), child: const Text('Open Chat')),
        ]),
      ),
    );
  }
}
