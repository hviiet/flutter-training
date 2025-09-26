import 'package:flutter_application_1/models/air_quality_model.dart';
import 'package:flutter_application_1/models/weather_model.dart';

abstract class WeatherState {}

class WeatherInitial extends WeatherState{}
class WeatherLoading extends WeatherState{}
class WeatherLoaded extends WeatherState{
  WeatherModel weather;
  AirQualityModel airQuality;
  WeatherLoaded({required this.weather, required this.airQuality});
}
class WeatherError extends WeatherState{
  String message;
  WeatherError({required this.message});
}
