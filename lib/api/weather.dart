import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

const WEATHER_API_KEY = '3a66d4f09c234b3393c11936253009';

class WeatherApi {
  final _dio = Dio();

  Future<Map<String, dynamic>> fetchForecastWeather({
    required String city,
    String days = '7',
    String aqi = 'yes',
    String alerts = 'no',
  }) async {
    final url =
        'http://api.weatherapi.com/v1/forecast.json?key=$WEATHER_API_KEY&q=$city&days=$days&aqi=$aqi&alerts=$alerts';
    final response = await _dio.get(url);
    return Map<String, dynamic>.from(response.data);
  }

  Future<WeatherResponse> fetchForecastWeatherModel({
    required String city,
    String days = '7',
    String aqi = 'yes',
    String alerts = 'no',
  }) async {
    final url =
        'http://api.weatherapi.com/v1/forecast.json?key=$WEATHER_API_KEY&q=$city&days=$days&aqi=$aqi&alerts=$alerts';
    final response = await _dio.get(url);
    return WeatherResponse.fromJson(Map<String, dynamic>.from(response.data));
  }
}
