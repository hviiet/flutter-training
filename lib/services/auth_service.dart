import 'package:dio/dio.dart';
import 'token_storage.dart';

class AuthService {
  static const baseUrl = 'https://api.escuelajs.co/api/v1';

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type' : 'application/json',
      }, 
      ),
  );

  final TokenStorage tokenStorage;

  AuthService(this.tokenStorage);

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      // gửi request đăng nhập đến API với email và password
      final response = await _dio.post(
        '/auth/login',
        data: {
          'email' : email,
          'password': password,
        }
      );
      // Lưu accessToken và refreshToken vào SharedPreferences

      await tokenStorage.saveTokens(
        accessToken: response.data['access_token'], 
        refreshToken: response.data['refresh_token']
        );
    } on DioException catch (error) {
      // xử lý lỗi khi đăng nhập thất bại
      if (error.response?.statusCode == 401){
        throw Exception('Email hoặc mật khẩu không chính xác');
      }

      throw Exception('Không thể kết nối đến máy chủ');
    }
  }

  Future<bool> refreshToken() async {
    //hàm xin token mới khi accessToken hết hạn, sử dụng refreshToken để xin accessToken mới
    final refreshToken = await tokenStorage.getRefreshToken();
    if (refreshToken == null) return false;

    try {
      // gửi request xin accessToken mới đến API với refreshToken
      final response = await _dio.post(
        '/auth/refresh-token',
        data: {'refreshToken': refreshToken},
      );
      // reset accessToken và refreshToken mới vào SharedPreferences

      await tokenStorage.saveTokens(
        accessToken: response.data['access_token'] as String,
        refreshToken: response.data['refresh_token'] as String,
      );
      return true;
    } catch (_) {
      await tokenStorage.clearTokens();
      return false;
    }
  
  }

  Future<void> logout() => tokenStorage.clearTokens();
  // xóa phiên lưu trên thiết bị khi người dùng đăng xuất
}
