import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Auth {

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
      final url = Uri.parse("https://api.escuelajs.co/api/v1/auth/login");
      final res = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email, "password": password}),
      );

      if (res.statusCode == 200 || res.statusCode == 201) {
        final data = jsonDecode(res.body);
        final access = data["access_token"];
        final refresh = data["refresh_token"];

        if (access == null || refresh == null) return false;

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString("access_token", access);
        await prefs.setString("refresh_token", refresh);

        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> logout() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove("access_token");
      await prefs.remove("refresh_token");
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<bool> isLoggedIn() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final accessToken = prefs.getString("access_token");
      return accessToken != null && accessToken.isNotEmpty;
    } catch (_) {
      return false;
    }
  }

  Future<String?> getAccessToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString("access_token");
    } catch (_) {
      return null;
    }
  }

  Future<String?> getRefreshToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString("refresh_token");
    } catch (_) {
      return null;
    }
  }

  Future<bool> refreshToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final refreshTokenValue = prefs.getString("refresh_token");
      
      if (refreshTokenValue == null) return false;

      final url = Uri.parse("https://api.escuelajs.co/api/v1/auth/refresh-token");
      final res = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"refreshToken": refreshTokenValue}),
      );

      if (res.statusCode == 200 || res.statusCode == 201) {
        final data = jsonDecode(res.body);
        final newAccessToken = data["access_token"];
        final newRefreshToken = data["refresh_token"];

        if (newAccessToken != null) {
          await prefs.setString("access_token", newAccessToken);
          if (newRefreshToken != null) {
            await prefs.setString("refresh_token", newRefreshToken);
          }
          return true;
        }
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> isTokenExpired() async {
    try {
      final accessToken = await getAccessToken();
      if (accessToken == null) return true;

      final parts = accessToken.split('.');
      if (parts.length != 3) return true;

      final payload = parts[1];
      final normalized = base64Url.normalize(payload);
      final resp = utf8.decode(base64Url.decode(normalized));
      final payloadMap = jsonDecode(resp);
      
      if (payloadMap['exp'] != null) {
        final exp = payloadMap['exp'] as int;
        final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
        return exp < now;
      }
      
      return false;
    } catch (e) {
      return true;
    }
  }

  Future<bool> ensureValidToken() async {
    try {
      final isExpired = await isTokenExpired();
      if (isExpired) {
        return await refreshToken();
      }
      return true;
    } catch (e) {
      return false;
    }
  }
}
