import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Dashboard')), body: Padding(padding: const EdgeInsets.all(16), child: Column(children: [Row(children: [Expanded(child: Card(child: Padding(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [Text('Active Cases'), SizedBox(height: 8), Text('12')])))), Expanded(child: Card(child: Padding(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [Text('Open Invoices'), SizedBox(height: 8), Text('3')]))))]), const SizedBox(height: 20), const Text('Recent Activity')])));
  }
}