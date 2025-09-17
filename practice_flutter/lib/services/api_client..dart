import 'dart:convert';
import 'package:http/http.dart' as http;

const String baseUrl = 'https://api.escuelajs.co';

class ApiClient {
  final http.Client _client;
  ApiClient({http.Client? client}) : _client = client ?? http.Client();

  Uri _uri(String path, [Map<String, dynamic>? query]) =>
      Uri.parse('$baseUrl$path').replace(queryParameters: query);

  Map<String, String> _jsonHeaders({String? bearerToken}) {
    final h = <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    if (bearerToken != null && bearerToken.isNotEmpty) {
      h['Authorization'] = 'Bearer $bearerToken';
    }
    return h;
  }

  Future<Map<String, dynamic>> postJson(
    String path, {
    Map<String, dynamic>? body,
    String? bearerToken,
  }) async {
    final res = await _client.post(
      _uri(path),
      headers: _jsonHeaders(bearerToken: bearerToken),
      body: jsonEncode(body ?? {}),
    );
    final data = _decodeBody(res.body);
    _throwIfError(res.statusCode, data);
    return data as Map<String, dynamic>;
  }

  Future<dynamic> getJson(
    String path, {
    Map<String, dynamic>? query,
    String? bearerToken,
  }) async {
    final res = await _client.get(
      _uri(path, query),
      headers: _jsonHeaders(bearerToken: bearerToken),
    );
    final data = _decodeBody(res.body);
    _throwIfError(res.statusCode, data);
    return data;
  }

  dynamic _decodeBody(String body) {
    if (body.isEmpty) return {};
    return jsonDecode(body);
  }

  void _throwIfError(int status, dynamic data) {
    if (status >= 200 && status < 300) return;
    final msg = (data is Map && data['message'] != null)
        ? data['message'].toString()
        : 'HTTP $status';
    throw ApiException(status, msg);
  }
}

class ApiException implements Exception {
  final int statusCode;
  final String message;
  ApiException(this.statusCode, this.message);
  @override
  String toString() => 'ApiException($statusCode): $message';
}
