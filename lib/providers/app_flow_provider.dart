import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/auth_service.dart';
import '../services/api_client.dart';
import '../services/token_storage.dart';

enum AppFlowStatus { loading, onboarding, login, authenticated }

class AppFlowProvider extends ChangeNotifier {
  static const _onboardingCompletedKey = 'onboarding_completed';

  final TokenStorage _tokenStorage = TokenStorage();
  late final AuthService _authService = AuthService(_tokenStorage);
  late final ApiClient apiClient;

  AppFlowStatus _status = AppFlowStatus.loading;
  String? _errorMessage;
  bool _isLoggingIn = false;

  AppFlowStatus get status => _status;
  String? get errorMessage => _errorMessage;
  bool get isLoggingIn => _isLoggingIn;

  AppFlowProvider() {
    apiClient = ApiClient(
      tokenStorage: _tokenStorage,
      authService: _authService,
      onSessionExpired: _handleSessionExpired,
    );
    initialize();
  }
  // khi khởi tạo AppFlowProvider, tạo một instance của ApiClient và gọi hàm initialize() để kiểm tra trạng thái của ứng dụng

  Future<void> _handleSessionExpired() async {
    _errorMessage = 'Phiên đăng nhập đã hết hạn. Vui lòng đăng nhập lại.';
    _status = AppFlowStatus.login;
    notifyListeners();
  }
  // xử lý đưa về màn hình login khi phiên đăng nhập hết hjan 

  Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();
    final completedOnboarding =
        prefs.getBool(_onboardingCompletedKey) ?? false;

    if (!completedOnboarding) {
      _status = AppFlowStatus.onboarding;
    } else if (await _tokenStorage.hasToken()) {
      _status = AppFlowStatus.authenticated;
    } else {
      _status = AppFlowStatus.login;
    }
    notifyListeners();
  } //kiểm tra trạng thái của ứng dụng 

  Future<void> completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_onboardingCompletedKey, true);
    _status = AppFlowStatus.login;
    notifyListeners();
  }
  // đánh dấu hoàn thành onboard chuyển sang login 

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    _isLoggingIn = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await _authService.login(email: email, password: password);
      _status = AppFlowStatus.authenticated;
      return true;
    } catch (error) {
      _errorMessage = error.toString().replaceFirst('Exception: ', '');
      //thất bại luu ND vào _errorMessage 
      return false;
    } finally {
      _isLoggingIn = false;
      notifyListeners();
    }
    //tắt trạng thái loading
  }

  Future<void> logout() async {
    await _authService.logout();
    _errorMessage = null;
    _status = AppFlowStatus.login;
    notifyListeners();
  }
}
