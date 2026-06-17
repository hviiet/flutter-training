import 'package:flutter/material.dart';
import 'package:flutter_training/core/token_storage.dart';
import 'package:flutter_training/models/user_profile.dart';
import 'package:flutter_training/services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();

  UserProfile? _userProfile;
  bool _isLoading = false;
  
  UserProfile? get userProfile => _userProfile;
  bool get isLoading => _isLoading;

  Future<void> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await _authService.login(email, password);
      await TokenStorage.saveToken(response.accessToken, response.refreshToken);

      _userProfile = await _authService.getUserProfile(response.accessToken);

    } catch (e) {
      _userProfile = null;
      throw Exception();
    }

     finally {
      _isLoading = false;
      notifyListeners();
    }
  }


  Future<void> logout() async {
    await TokenStorage.deleteToken();
  }

  Future<bool> checkAuth() async {
    final accessToken = await TokenStorage.getAccessToken();
    if (accessToken == null) {
      return false;
    }

    try {
      _userProfile = await _authService.getUserProfile(accessToken);
      return true;
    } catch (e) {
      await TokenStorage.deleteToken();
      return false;
    }
  }


}