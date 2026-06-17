import 'package:dio/dio.dart';
import 'package:flutter_training/core/token_storage.dart';
import 'package:flutter_training/models/login_response.dart';
import 'package:flutter_training/models/user_profile.dart';

class AuthService {
  late  Dio dio;

  AuthService() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://api.escuelajs.co/api/v1/auth', 
    ));

    dio.interceptors.add(InterceptorsWrapper(
      onError: (DioException e, handler) async {
        if (e.response?.statusCode == 401) {
          try {
            final currRefreshToken = await TokenStorage.getRefreshToken();
            if (currRefreshToken == null){
              throw Exception();
            }
            
            final refreshResponse = await Dio().post('https://api.escuelajs.co/api/v1/auth/refresh-token', 
              data: {
                'refresh_token': currRefreshToken,
            });

            await TokenStorage.saveToken(refreshResponse.data['access_token'], refreshResponse.data['refresh_token']);

            e.requestOptions.headers['Authorization'] = 'Bearer ${refreshResponse.data['access_token']}';

            final retryResponse = await dio.fetch(e.requestOptions);
            return handler.resolve(retryResponse);
          }
          catch (refreshError) {
            await TokenStorage.deleteToken();
            return handler.next(e);
          }
        }

        return handler.next(e);
      },
    ));
  }

  Future<LoginResponse> login(String email, String password) async {
    final response = await dio.post('/login', data: {
      'email': email,
      'password': password,
    });

    return LoginResponse.fromJson(response.data);
  }

  Future<UserProfile> getUserProfile(String accessToken) async {
    final response = await dio.get('/profile', options: Options(
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    ));

    return UserProfile.fromJson(response.data);
  }

}