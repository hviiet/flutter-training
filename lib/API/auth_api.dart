
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthApi {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://api.escuelajs.co/api/v1/auth/", 
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {"Content-Type": "application/json"},
    ),
  );

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await dio.post(
        'login', 
        data: {"email": email, "password": password},
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('access_token', response.data['access_token']);
        await prefs.setString('refresh_token', response.data['refresh_token']);
        return response.data;
      } else {
        throw Exception("Login failed: ${response.statusCode}");
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception("Login error: ${e.response?.data}");
      } else {
        throw Exception("Network error: $e");
      }
    }
  }

  Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('access_token');
  }

  Future<void> refreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    final refreshToken = prefs.getString('refresh_token');
    if (refreshToken == null) throw Exception("No refresh token found");

    try {
      final response = await dio.post('refresh-token', data: {
        "refreshToken": refreshToken,
      });

      if (response.statusCode == 200) {
        await prefs.setString('access_token', response.data['access_token']);
      } else {
        throw Exception("Token refresh failed");
      }
    } catch (e) {
      throw Exception("Token refresh error: $e");
    }
  }

  Future<Response> get(String path) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('access_token');

    try {
      final response = await dio.get(
        path,
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      return response;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        await refreshToken();
        token = prefs.getString('access_token');
        final retryResponse = await dio.get(
          path,
          options: Options(headers: {"Authorization": "Bearer $token"}),
        );
        return retryResponse;
      } else {
        rethrow;
      }
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('access_token');
    await prefs.remove('refresh_token');
  }
}
