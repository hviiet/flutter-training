import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final dio = Dio();
  final String baseUrl = "https://api.weatherapi.com/v1";
  final String apiKey = dotenv.env['WEATHER_KEY'] ?? ""; 

  Future<WeatherModel> getWeather(String city, {int days = 7}) async {
    try {
      final response = await dio.get(
        '$baseUrl/forecast.json',
        queryParameters: {
          'key': apiKey,
          'q': city,
          'days': days,
        },
      );
      return WeatherModel.fromJson(response.data);
    } catch (e) {
      print("Error fetching weather data: $e");
      rethrow;
    }
  }
}