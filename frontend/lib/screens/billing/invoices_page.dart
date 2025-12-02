import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InvoicesPage extends StatelessWidget {
  const InvoicesPage({super.key});
  @override Widget build(BuildContext context) {
    final invoiceId = 1;
    final pdfUrl = 'http://localhost:8000/api/invoices/\$invoiceId/pdf/';
    return Scaffold(appBar: AppBar(title: const Text('Invoices')), body: Center(child: ElevatedButton(onPressed: () async { final uri = Uri.parse(pdfUrl); if (await canLaunchUrl(uri)) await launchUrl(uri); else ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Could not open PDF'))); }, child: const Text('Download Invoice PDF'))));
  }
}