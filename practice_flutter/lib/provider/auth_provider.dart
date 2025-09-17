import 'package:flutter/foundation.dart';
import '../services/auth_service.dart';
import '../services/api_client..dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _auth = AuthService(ApiClient());

  bool _loading = false;
  String? _error;
  UserProfile? _profile;

  bool get loading => _loading;
  String? get error => _error;
  UserProfile? get profile => _profile;
  bool get isLoggedIn => _profile != null;

  /// Gọi khi mở app để khôi phục phiên
  Future<void> restoreSession() async {
    try {
      _setLoading(true);
      final hasSession = await _auth.isLoggedIn();
      if (hasSession) {
        _profile = await _auth.getProfile();
      } else {
        _profile = null;
      }
      _error = null;
    } catch (e) {
      _profile = null;
      _error = e.toString();
    } finally {
      _setLoading(false);
    }
  }

  /// Đăng nhập
  Future<void> login(String email, String password) async {
    try {
      _setLoading(true);
      _error = null;
      await _auth.login(email: email, password: password);
      _profile = await _auth.getProfile();
    } catch (e) {
      _profile = null;
      _error = e.toString();
    } finally {
      _setLoading(false);
    }
  }

  /// Đăng xuất
  Future<void> logout() async {
    await _auth.logout();
    _profile = null;
    notifyListeners();
  }

  void _setLoading(bool v) {
    _loading = v;
    notifyListeners();
  }
}
