import 'package:shared_preferences/shared_preferences.dart';
import 'api_client.dart';

class AuthTokens {
  final String accessToken;
  final String refreshToken;
  const AuthTokens({required this.accessToken, required this.refreshToken});

  factory AuthTokens.fromJson(Map<String, dynamic> json) => AuthTokens(
    accessToken: (json['access_token'] ?? '').toString(),
    refreshToken: (json['refresh_token'] ?? '').toString(),
  );

  bool get isValid => accessToken.isNotEmpty;
}

class UserProfile {
  final int id;
  final String name;
  final String email;
  final String role;
  final String avatar;

  const UserProfile({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.avatar,
  });

  factory UserProfile.fromJson(Map<String, dynamic> j) => UserProfile(
    id: j['id'] is int ? j['id'] as int : int.tryParse('${j['id']}') ?? 0,
    name: (j['name'] ?? '').toString(),
    email: (j['email'] ?? '').toString(),
    role: (j['role'] ?? '').toString(),
    avatar: (j['avatar'] ?? '').toString(),
  );
}

class AuthService {
  static const _kAccess = 'access_token';
  static const _kRefresh = 'refresh_token';

  final ApiClient _api;

  AuthService(this._api);

  /// Đăng nhập → trả về token & lưu vào SharedPreferences
  Future<AuthTokens> login({
    required String email,
    required String password,
  }) async {
    final json = await _api.postJson(
      '/api/v1/auth/login',
      body: {'email': email.trim(), 'password': password.trim()},
    );

    final tokens = AuthTokens.fromJson(json);
    if (!tokens.isValid) {
      throw ApiException(500, 'Không lấy được access_token');
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kAccess, tokens.accessToken);
    await prefs.setString(_kRefresh, tokens.refreshToken);
    return tokens;
  }


  Future<UserProfile> getProfile() async {
    final access = await readAccessToken();
    if (access == null || access.isEmpty) {
      throw ApiException(401, 'Chưa đăng nhập');
    }
    final json = await _api.getJson(
      '/api/v1/auth/profile',
      bearerToken: access,
    );
    return UserProfile.fromJson(json as Map<String, dynamic>);
  }

  Future<String?> readAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_kAccess);
  }

  Future<String?> readRefreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_kRefresh);
  }

  
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_kAccess);
    await prefs.remove(_kRefresh);
  }

  Future<bool> isLoggedIn() async {
    final access = await readAccessToken();
    return access != null && access.isNotEmpty;
  }
}
