import 'package:weather_app/models/air_quality_model.dart';
import 'package:weather_app/models/weather_model.dart';

class CityData {
  final AirQualityModel? airQuality;
  final WeatherModel? weather;

  CityData({
    required this.airQuality,
    required this.weather,
  });
}