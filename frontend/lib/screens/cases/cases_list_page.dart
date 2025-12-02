import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CasesListPage extends StatelessWidget {
  const CasesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cases")),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (_, i) {
          return ListTile(
            title: Text("Case #$i"),
            subtitle: const Text("Client name"),
            onTap: () => context.go("/cases/$i"),
          );
        },
      ),
    );
  }
}
