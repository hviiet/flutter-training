import 'package:dio/dio.dart';
import '/models/air_quality_model.dart';
import '/models/weather_model.dart';

class WeatherApiService {
  final Dio _dio = Dio();

  final String _aqiApiKey = '7ce0bbe21640be9eabaf7df5e0defd3ba8bbe6c8';
  final String _weatherApiKey = '351606b2ffdd40219a120744252910';

  Future<AirQualityData> getAirQualityData(String city) async {
    try {
      final response = await _dio.get('https://api.waqi.info/feed/$city/?token=$_aqiApiKey');
      return AirQualityData.fromJson(response.data);
    } catch (e) {
      print('Lỗi khi gọi API Chất lượng không khí: $e');
      throw Exception('Failed to load air quality data');
    }
  }

  Future<WeatherData> getWeatherData(String city) async {
    try {
      final response = await _dio.get(
          'http://api.weatherapi.com/v1/forecast.json?key=$_weatherApiKey&q=$city&days=1&aqi=no&alerts=no');
      return WeatherData.fromJson(response.data);
    } catch (e) {
      print('Lỗi khi gọi API Thời tiết: $e');
      throw Exception('Failed to load weather data');
    }
  }
}