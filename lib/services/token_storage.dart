import 'package:shared_preferences/shared_preferences.dart';

class TokenStorage {
  static const _accessTokenKey = 'access_token';
  static const _refreshTokenKey = 'refresh_token';
 // lưu accessToken và refreshToken vào SharedPreferences sau khi đăng nhập thành công
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(_accessTokenKey, accessToken);
    await prefs.setString(_refreshTokenKey, refreshToken);
  }

  Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_accessTokenKey);
  } // lấy accessToken từ SharedPreferences để sử dụng trong các request API

  Future<String?> getRefreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_refreshTokenKey);
  } // lấy refreshToken từ SharedPreferences để sử dụng trong các request API

  Future<void> clearTokens() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(_accessTokenKey);
    await prefs.remove(_refreshTokenKey);
  } // xóa accessToken và refreshToken khỏi SharedPreferences khi người dùng đăng xuất 

  Future<bool> hasToken() async{
    return await getAccessToken() != null;
  } //kiểm tra thiết bị đã có accessToken hay chưa 

}
