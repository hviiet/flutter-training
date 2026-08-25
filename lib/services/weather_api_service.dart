import 'package:dio/dio.dart';

import '../models/air_quality.dart';
import '../models/weather.dart';

class WeatherApiService {
  // Base URLs for the APIs
  static const _aqicnBaseUrl = 'https://api.waqi.info';
  // Base URL for the WeatherAPI
  static const _weatherBaseUrl = 'https://api.weatherapi.com/v1';

  final Dio _dio;
  final String _aqicnToken;
  final String _weatherApiKey;

  WeatherApiService({
    //
    Dio? dio,
    required String aqicnToken,
    required String weatherApiKey,
  }) : _dio = dio ?? Dio(),
       _aqicnToken = aqicnToken.trim(),
       _weatherApiKey = weatherApiKey.trim();

  Future<AirQuality> getAirQualityData(String city) async {
    if (_aqicnToken.isEmpty) {
      throw Exception('Chưa cấu hình AQICN_TOKEN');
    }

    try {
      final response = await _dio.get(
        '$_aqicnBaseUrl/feed/${Uri.encodeComponent(city)}/',
        queryParameters: {'token': _aqicnToken},
      );
      final json = Map<String, dynamic>.from(response.data);
      // Kiểm tra trạng thái trả về từ API
      if (json['status'] != 'ok') {
        throw Exception('AQICN: ${json['data'] ?? 'Không có dữ liệu'}');
      }

      return AirQuality.fromJson(json);
    } on DioException catch (error) {
      throw Exception('AQICN: ${error.message ?? 'Không thể kết nối API'}');
    }
  }

  Future<Weather> getWeatherData(String city) async {
    if (_weatherApiKey.isEmpty) {
      throw Exception('Chưa cấu hình WEATHER_API_KEY');
    }

    try {
      // Gọi API thời tiết
      final response = await _dio.get(
        '$_weatherBaseUrl/forecast.json',
        queryParameters: {
          'key': _weatherApiKey,
          'q': city,
          'days': 7,
          'aqi': 'no',
          'alerts': 'no',
        },
      );

      return Weather.fromJson(Map<String, dynamic>.from(response.data));
    } on DioException catch (error) {
      var message = error.message ?? 'Không thể kết nối API';
      final data = error.response?.data;

      if (data is Map && data['error'] is Map) {
        final apiMessage = (data['error'] as Map)['message'];
        if (apiMessage != null) message = apiMessage.toString();
      }

      throw Exception('WeatherAPI: $message');
    }
  }
}
