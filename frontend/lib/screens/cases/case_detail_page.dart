import 'package:flutter/material.dart';

class CaseDetailPage extends StatelessWidget {
  final String caseId;
  const CaseDetailPage({super.key, required this.caseId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Case $caseId")),
      body: Center(child: Text("Details for case $caseId")),
    );
  }
}
