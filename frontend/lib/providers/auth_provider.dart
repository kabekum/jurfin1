import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  String? _token;
  late ApiService api;
  AuthProvider(String baseUrl) { api = ApiService(baseUrl); }

  String? get token => _token;

  Future<bool> login(String username, String password) async {
    try {
      final resp = await api.login(username, password);
      if (resp.statusCode == 200) {
        _token = resp.data['access'];
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('jwt', _token!);
        notifyListeners();
        return true;
      }
    } catch (e) {
      return false;
    }
    return false;
  }

  Future<void> logout() async {
    _token = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('jwt');
    notifyListeners();
  }
}