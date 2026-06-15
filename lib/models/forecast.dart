import 'weather_status.dart';

class Forecast {
  final String day;
  final int aqi;
  final int temperature;
  final WeatherStatus weatherStatus;

  Forecast({
    required this.day,
    required this.aqi,
    required this.temperature,
    required this.weatherStatus,
  });
}