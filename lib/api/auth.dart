import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth {
  final dio = Dio();

  Auth() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final prefs = await SharedPreferences.getInstance();
          final access = prefs.getString("access_token");
          if (access != null && access.isNotEmpty) {
            options.headers["Authorization"] = "Bearer $access";
          }
          handler.next(options);
        },
        onError: (e, handler) async {
          final status = e.response?.statusCode ?? 0;
          final path = e.requestOptions.path;
          final isAuthPath =
              path.contains('/auth/login') || path.contains('/auth/refresh');
          final alreadyRetried = e.requestOptions.extra['__ret'] == true;

          if (status == 401 && !isAuthPath && !alreadyRetried) {
            try {
              await _refreshToken();
              e.requestOptions.extra['__ret'] = true;

              final prefs = await SharedPreferences.getInstance();
              final newAccess = prefs.getString("access_token");
              if (newAccess != null && newAccess.isNotEmpty) {
                e.requestOptions.headers['Authorization'] = 'Bearer $newAccess';
              }
              final res = await dio.fetch(e.requestOptions);
              return handler.resolve(res);
            } catch (_) {
              final prefs = await SharedPreferences.getInstance();
              await prefs.remove('access_token');
              await prefs.remove('refresh_token');
              return handler.next(e);
            }
          }

          handler.next(e);
        },
      ),
    );
  }

  Future<void> _refreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    final refresh = prefs.getString("refresh_token");
    if (refresh == null || refresh.isEmpty) {
      throw DioException(
        requestOptions: RequestOptions(path: '/auth/refresh'),
        error: 'No refresh token',
      );
    }
    final res = await dio.post(
      "https://api.escuelajs.co/api/v1/auth/refresh-token",
      data: {"refreshToken": refresh},
      options: Options(headers: {"Content-Type": "application/json"}),
    );

    if (res.statusCode == 200 || res.statusCode == 201) {
      final data = res.data;
      final newAccess = data["access_token"] ?? data["accessToken"];
      final newRefresh =
          data["refresh_token"] ?? data["refreshToken"] ?? refresh;
      if (newAccess == null) {
        throw DioException(
          requestOptions: RequestOptions(path: '/auth/refresh'),
          error: 'No access token returned',
        );
      }
      await prefs.setString("access_token", newAccess);
      await prefs.setString("refresh_token", newRefresh);
      return;
    }
    throw DioException(
      requestOptions: RequestOptions(path: '/auth/refresh'),
      error: 'Refresh failed',
      response: res,
    );
  }

  String? validateEmail(String email) {
    if (email.trim().isEmpty) {
      return "Please enter your email";
    }
    final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!regex.hasMatch(email.trim())) {
      return "Please enter a valid email";
    }
    return null;
  }

  String? validatePassword(String password) {
    if (password.trim().isEmpty) {
      return "Please enter your password";
    }
    if (password.length < 6) {
      return "Password must be at least 6 characters";
    }
    return null;
  }

  Future<bool> login(String email, String password) async {
    try {
      final res = await dio.post(
        "https://api.escuelajs.co/api/v1/auth/login",
        data: {"email": email, "password": password},
        options: Options(headers: {"Content-Type": "application/json"}),
      );

      if (res.statusCode == 200 || res.statusCode == 201) {
        final data = res.data;
        final access = data["access_token"];
        final refresh = data["refresh_token"];

        if (access == null || refresh == null) return false;

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString("access_token", access);
        await prefs.setString("refresh_token", refresh);

        return true;
      }
      return false;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return false;
      }
      if (e.response?.statusCode == 403) {
        return false;
      }
      return false;
    } catch (_) {
      return false;
    }
  }
}
