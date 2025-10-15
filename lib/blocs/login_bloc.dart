import 'dart:async';
import 'package:demo_flutter/API/auth_api.dart';
import 'package:demo_flutter/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginBloc {
  final _authApi = AuthApi();

  // controllers cho Stream
  final _userController = StreamController<String>();
  final _passController = StreamController<String>();
  final _loadingController = StreamController<bool>();
  final _loginResultController = StreamController<bool>();

  // stream getters
  Stream<String> get userStream => _userController.stream;
  Stream<String> get passStream => _passController.stream;
  Stream<bool> get loadingStream => _loadingController.stream;
  Stream<bool> get loginResultStream => _loginResultController.stream;

  // validate input
  bool isValidInfo(String username, String pass) {
    if (!Validators.isvalidUser(username)) {
      _userController.sink.addError("❌ Invalid email format");
      return false;
    }
    if (!Validators.isvalidPass(pass)) {
      _passController.sink.addError("❌ Password must be at least 6 chars");
      return false;
    }
    return true;
  }

  // xử lý login
  Future<void> login(String username, String pass) async {
    if (!isValidInfo(username, pass)) return;

    _loadingController.sink.add(true);
    try {
      // Gọi API đăng nhập
      final response = await _authApi.login(username, pass);

      // ✅ Kiểm tra key đúng theo response thật
      if (response['access_token'] != null && response['refresh_token'] != null) {
        // Lưu token vào local storage
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('access_token', response['access_token']);
        await prefs.setString('refresh_token', response['refresh_token']);

        debugPrint("✅ Login successful!");
        _loginResultController.sink.add(true);
      } else {
        debugPrint("⚠️ Login failed: Missing token fields");
        _loginResultController.sink.add(false);
      }
    } catch (e) {
      debugPrint("❌ Login error: $e");
      _loginResultController.sink.add(false);
    } finally {
      _loadingController.sink.add(false);
    }
  }

  void dispose() {
    _userController.close();
    _passController.close();
    _loadingController.close();
    _loginResultController.close();
  }
}
