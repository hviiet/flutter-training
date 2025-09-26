import 'dart:async';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth {
  final dio = Dio();

  Auth(){
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final prefs = await SharedPreferences.getInstance();
          final accessToken = prefs.getString("access_token");
          if(accessToken != null) options.headers["Authorization"] = "Bearer $accessToken";
          handler.next(options);
        },
        onError: (error, handler) async {
          if(error.response?.statusCode == 401){
            final isRefresh = await refreshToken();
            if(isRefresh){
              final prefs = await SharedPreferences.getInstance();
              final newAccessToken = prefs.getString("access_token");
              error.requestOptions.headers["Authorization"] = "Bearer $newAccessToken";

              final retryResponse = await dio.fetch(error.requestOptions);
              return handler.resolve(retryResponse);
            }
            else{
              await logout();
            }
          }
          return handler.next(error);
        },
      )
    );
  }

  Future<bool> login(String email, String password) async{
    try {
      final response = await dio.post("https://api.escuelajs.co/api/v1/auth/login",
        data: {
          "email": email,
          "password": password
        }
      );

      final accessToken = response.data["access_token"];
      final refreshToken = response.data["refresh_token"];

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("access_token", accessToken);
      await prefs.setString("refresh_token", refreshToken);

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> logout() async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("access_token");
    await prefs.remove("refresh_token");
  }

  Future<bool> refreshToken() async{
    final prefs = await SharedPreferences.getInstance();
    final refreshToken = prefs.getString("refresh_token");

    if(refreshToken == null) return false;

    try {
      final response = await dio.post("https://api.escuelajs.co/api/v1/auth/refresh-token",
        data: {"refreshToken": refreshToken}
      );

      final newAccessToken = response.data["access_token"];
      final newRefreshToken = response.data["refresh_token"];

      await prefs.setString("access_token", newAccessToken);
      await prefs.setString("refresh_token", newRefreshToken);

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<Map<String, dynamic>?> getProfile() async{
    try {
      final response = await dio.get("https://api.escuelajs.co/api/v1/auth/profile");
      return response.data;
    } catch (e) {
      return null;
    }
  }
}