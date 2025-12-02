import 'package:flutter/material.dart';
import 'api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class AuthProvider extends ChangeNotifier {
  String? accessToken;
  final ApiService api = ApiService('http://10.0.2.2:8000'); // replace with your backend URL

  Future<bool> login(String username, String password) async {
    final r = await api.login(username, password);
    if (r['status'] == 200) {
      final body = jsonDecode(r['body']);
      accessToken = body['access'];
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('jwt', accessToken!);
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<void> logout() async {
    accessToken = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('jwt');
    notifyListeners();
  }
}
