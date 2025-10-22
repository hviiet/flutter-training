import 'dart:convert';
import 'package:http/http.dart' as http;

const String defaultBaseUrl = 'https://api.escuelajs.co';

class ApiClient {
  final http.Client _client;
  ApiClient({http.Client? client}) : _client = client ?? http.Client();

  /// ✅ Sửa lại để xây dựng URI an toàn và đúng cách
  Uri _uri(String base, String path, [Map<String, dynamic>? query]) {
    final uri = Uri.parse(base);
    // Nối các đường dẫn và loại bỏ dấu '/' lặp lại
    final combinedPath = Uri.parse(uri.path + path).path;

    // Sử dụng Uri.https để xây dựng URI hoàn chỉnh
    return Uri.https(
      uri.host,
      combinedPath,
      query?.map((k, v) => MapEntry(k, v.toString())),
    );
  }

  Map<String, String> _jsonHeaders({String? bearerToken}) {
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    if (bearerToken != null && bearerToken.isNotEmpty) {
      headers['Authorization'] = 'Bearer $bearerToken';
    }
    return headers;
  }

  Future<dynamic> getJson(
    String path, {
    Map<String, dynamic>? query,
    String? bearerToken,
    String? overrideBaseUrl,
  }) async {
    final uri = _uri(overrideBaseUrl ?? defaultBaseUrl, path, query);
    try {
      final res = await _client.get(
        uri,
        headers: _jsonHeaders(bearerToken: bearerToken),
      );

      if (res.statusCode < 200 || res.statusCode >= 300) {
        throw ApiException(res.statusCode, 'HTTP error: ${res.reasonPhrase}');
      }
      return _decodeBody(res.body);
    } on http.ClientException catch (e) {
      // Bắt lỗi kết nối cụ thể
      throw ApiException(
        500,
        'ClientException: Failed to fetch, uri=${uri.toString()} - $e',
      );
    } catch (e) {
      // Bắt các lỗi khác
      throw ApiException(500, 'Error fetching: $e');
    }
  }

  Future<Map<String, dynamic>> postJson(
    String path, {
    Map<String, dynamic>? body,
    String? bearerToken,
    String? overrideBaseUrl,
  }) async {
    final uri = _uri(overrideBaseUrl ?? defaultBaseUrl, path);
    try {
      final res = await _client.post(
        uri,
        headers: _jsonHeaders(bearerToken: bearerToken),
        body: jsonEncode(body ?? {}),
      );
      if (res.statusCode < 200 || res.statusCode >= 300) {
        throw ApiException(res.statusCode, 'HTTP error: ${res.reasonPhrase}');
      }
      return _decodeBody(res.body) as Map<String, dynamic>;
    } catch (e) {
      throw ApiException(500, 'Error posting: $e');
    }
  }

  dynamic _decodeBody(String body) {
    if (body.isEmpty) return {};
    try {
      return jsonDecode(body);
    } catch (e) {
      throw ApiException(500, 'Invalid JSON: $e');
    }
  }
}

class ApiException implements Exception {
  final int statusCode;
  final String message;
  ApiException(this.statusCode, this.message);
  @override
  String toString() => 'ApiException($statusCode): $message';
}
