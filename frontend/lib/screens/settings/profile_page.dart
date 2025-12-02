import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override Widget build(BuildContext context) { return Scaffold(appBar: AppBar(title: const Text('Profile')), body: Padding(padding: const EdgeInsets.all(16.0), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [CircleAvatar(radius: 40), SizedBox(height: 20), Text('John Doe', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)), Text('john@example.com')]))); }
}