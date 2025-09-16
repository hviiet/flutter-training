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
      // Handle any network or parsing errors
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
}
