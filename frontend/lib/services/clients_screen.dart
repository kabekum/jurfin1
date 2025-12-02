import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'package:provider/provider.dart';
import '../services/auth_provider.dart';

class ClientsScreen extends StatelessWidget {
  const ClientsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Clients')),
      body: FutureBuilder(
        future: ApiService(auth.api.baseUrl).fetchClients(auth.token ?? ''),
        builder: (context, snapshot) {
          if (snapshot.connectionState!=ConnectionState.done) return const Center(child: CircularProgressIndicator());
          if (snapshot.hasError) return Center(child: Text('Error: ${snapshot.error}'));
          final clients = snapshot.data as List;
          return ListView.builder(
            itemCount: clients.length,
            itemBuilder: (_, i) => ListTile(title: Text(clients[i]['name']), subtitle: Text(clients[i]['email'] ?? '')),
          );
        },
      ),
    );
  }
}
