import 'package:flutter/material.dart';

class ClientDetailPage extends StatelessWidget {
  final String id;
  const ClientDetailPage({super.key, required this.id});
  @override Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Client \$id')), body: Padding(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Client Name \$id', style: Theme.of(context).textTheme.headlineSmall), const SizedBox(height: 8), const Text('Email: client@example.com'), const SizedBox(height: 8), const Text('Phone: +123456789')])));
  }
}