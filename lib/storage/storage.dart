import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

// Kiểu dữ liệu để lưu trữ
typedef CachedWeatherData = ({
  Map<String, dynamic> weather,
  String street,
  Map<String, dynamic>? airQuality,
});

class Storage {
  static const _weatherDataKey = 'cached_weather_data';

  static Future<void> saveTokens(String access, String refresh) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('access_token', access);
    await prefs.setString('refresh_token', refresh);
  }

  static Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('access_token');
  }

  static Future<String?> getRefreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('refresh_token');
  }

  static Future<void> clearTokens() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('access_token');
    await prefs.remove('refresh_token');
  }

  static Future<void> saveWeatherData(CachedWeatherData data) async {
    final prefs = await SharedPreferences.getInstance();

    final jsonString = json.encode({
      'weather': data.weather,
      'street': data.street,
      'airQuality': data.airQuality,
    });
    await prefs.setString(_weatherDataKey, jsonString);
  }

  static Future<CachedWeatherData?> getWeatherData() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_weatherDataKey);

    if (jsonString == null) {
      return null;
    }

    try {
      final jsonMap = json.decode(jsonString) as Map<String, dynamic>;

      return (
        weather: Map<String, dynamic>.from(jsonMap['weather'] as Map),
        street: jsonMap['street'] as String,
        airQuality: (jsonMap['airQuality'] is Map)
            ? Map<String, dynamic>.from(jsonMap['airQuality'] as Map)
            : null,
      );
    } catch (e) {
      await prefs.remove(_weatherDataKey);
      return null;
    }
  }

  static Future<void> clearWeatherData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_weatherDataKey);
  }
}
