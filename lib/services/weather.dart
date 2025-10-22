import 'package:dio/dio.dart';
import 'package:flutter_training/models/weather_data.dart';

class WeatherApiService {
  final Dio _dio;
  static const String _baseUrl = 'https://api.weatherapi.com/v1';
  static const String _apiKey = '30890248d8d5463593485407252210'; // Your API key

  WeatherApiService({Dio? dio}) : _dio = dio ?? Dio(BaseOptions(
    baseUrl: _baseUrl,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ));

  /// Fetch current weather and forecast for a location
  /// [location] can be city name, coordinates (lat,lon), or IP address
  /// [days] number of days for forecast (1-14)
  Future<WeatherData> getWeatherForecast({
    required String location,
    int days = 7,
  }) async {
    try {
      final response = await _dio.get(
        '/forecast.json',
        queryParameters: {
          'key': _apiKey,
          'q': location,
          'days': days,
          'aqi': 'yes', // Enable air quality data
          'alerts': 'no',
        },
      );

      if (response.statusCode == 200) {
        return WeatherData.fromJson(response.data);
      } else {
        throw Exception('Failed to load weather data: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception('Connection timeout');
      } else if (e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Receive timeout');
      } else if (e.response != null) {
        throw Exception('Error: ${e.response?.data['error']['message'] ?? 'Unknown error'}');
      } else {
        throw Exception('Network error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  /// Fetch current weather only
  Future<Current> getCurrentWeather({required String location}) async {
    try {
      final response = await _dio.get(
        '/current.json',
        queryParameters: {
          'key': _apiKey,
          'q': location,
          'aqi': 'yes', // Enable air quality data
        },
      );

      if (response.statusCode == 200) {
        return Current.fromJson(response.data['current']);
      } else {
        throw Exception('Failed to load current weather: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception('Error: ${e.response?.data['error']['message'] ?? 'Unknown error'}');
      } else {
        throw Exception('Network error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}
