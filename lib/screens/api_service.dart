import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://api.escuelajs.co/api/v1',
  ));

  // Hàm đăng nhập
  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await _dio.post(
        '/auth/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 201) {
        return response.data;
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          error: 'Login failed with status code ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      final errorMessage = e.response?.data['message'] ?? 'An unknown error occurred';
      throw Exception('Failed to login: $errorMessage');
    }
  }
}