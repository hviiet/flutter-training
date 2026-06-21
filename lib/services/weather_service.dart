import 'package:dio/dio.dart';

class WeatherService {
  final Dio _dio = Dio();

  final String _baseUrl = 'https://api.weatherapi.com/v1';
  final String _apiKey = 'f06572fe60894cba8b5133600261706';

  Future<Map<String, dynamic>> fetchWeatherData(String cityName, int days) async {
    try {
      final resp = await _dio.get(
        '$_baseUrl/forecast.json',
        queryParameters: {
          'key': _apiKey,
          'q': cityName,
          'days': days,
          'aqi': 'no',
          'alerts': 'no',
        },
      );

      return resp.data;
    } catch (e) {
      throw Exception('Failed to load weather data: $e');
    }
  }
}