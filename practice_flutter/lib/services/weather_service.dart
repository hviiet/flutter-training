import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather_model.dart';
import '../models/weather_hour_model.dart';
import '../models/weather_forecast_model.dart'; // thêm model dự báo 7 ngày

class WeatherService {
  /// Gọi API để lấy thời tiết hiện tại + dự báo 7 ngày
  Future<Map<String, dynamic>> fetchWeatherFull(
    String city,
    String apiKey,
  ) async {
    final url = Uri.parse(
      'https://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$city&days=7&aqi=yes&alerts=no',
    );

    try {
      final response = await http.get(url).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // --- Hiện tại ---
        final weather = WeatherModel.fromJson(data);

        // --- Dự báo theo giờ (chỉ lấy ngày đầu tiên) ---
        final List hourlyList = data['forecast']['forecastday'][0]['hour'];
        final hourlyForecast = hourlyList
            .map((hourData) => WeatherHourModel.fromJson(hourData))
            .toList();

        // --- Dự báo 7 ngày ---
        final List forecastList = data['forecast']['forecastday'];
        final forecastDays = forecastList
            .map((dayData) => ForecastDayModel.fromJson(dayData))
            .toList();

        return {
          'current': weather,
          'hourly': hourlyForecast,
          'forecast': forecastDays,
        };
      } else {
        throw Exception('Failed to fetch weather data: ${response.body}');
      }
    } on Exception catch (e) {
      throw Exception('Network or parse error: $e');
    }
  }
}
