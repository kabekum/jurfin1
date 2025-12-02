import 'package:flutter/material.dart';

class DocumentsPage extends StatelessWidget {
  const DocumentsPage({super.key});
  @override Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Documents')), body: ListView.builder(itemCount: 8, itemBuilder: (_, i) => ListTile(leading: const Icon(Icons.picture_as_pdf), title: Text('Document #\$i.pdf'), subtitle: const Text('Uploaded by Admin'))));
  }
}