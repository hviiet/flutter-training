import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth {
  final dio = Dio();

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
