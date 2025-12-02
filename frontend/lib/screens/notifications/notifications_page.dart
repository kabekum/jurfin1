import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});
  @override Widget build(BuildContext context) { return Scaffold(appBar: AppBar(title: const Text('Notifications')), body: ListView(children: const [ListTile(leading: Icon(Icons.notifications), title: Text('New document uploaded')), ListTile(leading: Icon(Icons.notifications), title: Text('Invoice paid'))])); }
}