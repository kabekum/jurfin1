import 'package:flutter/material.dart';
import 'client_detail_page.dart';

class ClientsListPage extends StatelessWidget {
  const ClientsListPage({super.key});

  @override Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Clients')), body: ListView.builder(itemCount: 10, itemBuilder: (_, i) => ListTile(title: Text('Client #\$i'), subtitle: const Text('client@example.com'), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ClientDetailPage(id: '\$i'))))));
  }
}