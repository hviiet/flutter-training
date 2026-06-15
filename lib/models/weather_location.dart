import 'weather_status.dart';

class WeatherLocation {
  final String name;
  final String city;
  final int aqi;
  final int temperature;
  final WeatherStatus weatherStatus;
  final int feelsLike;

  WeatherLocation({
    required this.name,
    required this.city,
    required this.aqi,
    required this.temperature,
    required this.weatherStatus,
    required this.feelsLike,
  });
}