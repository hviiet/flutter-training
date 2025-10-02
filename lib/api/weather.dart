import 'package:dio/dio.dart';

// ignore: constant_identifier_names
const WEATHER_API_KEY = '3a66d4f09c234b3393c11936253009';

class WeatherApi {
  final _dio = Dio();

  Future<Map<String, dynamic>> fetchForecastWeather({
    required String city,
    required String days,
    required String aqi,
    required String alerts,
  }) async {
    final url =
        'http://api.weatherapi.com/v1/forecast.json?key=$WEATHER_API_KEY&q=$city&days=$days&aqi=$aqi&alerts=$alerts';

    final response = await _dio.get(url);
    return Map<String, dynamic>.from(response.data);
  }
}
