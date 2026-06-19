import 'package:dio/dio.dart';

class WeatherService {
  final dio = Dio();
  final String baseUrl = "https://api.weatherapi.com/v1";
  final String apiKey = "3ea2b73f16d7454980b92300261606"; 

  Future<Map<String, dynamic>> getWeather(String city, {int days = 7}) async {
    try {
      final response = await dio.get(
        '$baseUrl/forecast.json',
        queryParameters: {
          'key': apiKey,
          'q': city,
          'days': days,
        },
      );
      return response.data;
    } catch (e) {
      print("Error fetching weather data: $e");
      throw e;
    }
  }
}