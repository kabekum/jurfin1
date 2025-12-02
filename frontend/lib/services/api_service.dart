import 'dart:convert';
import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;
  ApiService(String baseUrl) : dio = Dio(BaseOptions(baseUrl: baseUrl, connectTimeout: 5000));

  Future<Response> login(String username, String password) async {
    return dio.post('/api/auth/token/', data: {'username': username, 'password': password});
  }

  Future<Response> getClients(String token) async {
    return dio.get('/api/clients/', options: Options(headers: {'Authorization': 'Bearer \$token'}));
  }

  Future<Response> getCases(String token) async {
    return dio.get('/api/matters/', options: Options(headers: {'Authorization': 'Bearer \$token'}));
  }

  Future<Response> getInvoicePdf(int invoiceId, String token) async {
    return dio.get('/api/invoices/\$invoiceId/pdf/', options: Options(responseType: ResponseType.bytes, headers: {'Authorization': 'Bearer \$token'}));
  }
}
