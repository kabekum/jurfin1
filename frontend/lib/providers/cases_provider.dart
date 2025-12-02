import 'package:flutter/material.dart';
import '../services/api_service.dart';

class CasesProvider extends ChangeNotifier {
  final ApiService api;
  List<dynamic> cases = [];
  CasesProvider(this.api);

  Future<void> loadCases(String token) async {
    final resp = await api.getCases(token);
    if (resp.statusCode == 200) {
      cases = resp.data as List<dynamic>;
      notifyListeners();
    }
  }
}