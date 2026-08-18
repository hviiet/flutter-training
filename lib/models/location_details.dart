import 'air_quality.dart';
import 'weather.dart';

class LocationDetails{
  final AirQuality airQuality;
  final Weather weather;

  const LocationDetails({
    required this.airQuality,
    required this.weather,
  });
}