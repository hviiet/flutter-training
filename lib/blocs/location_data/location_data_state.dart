import 'package:air_quality/models/air_quality_model.dart';
import 'package:air_quality/models/weather_model.dart';

abstract class LocationDataState {}

class LocationDataInitial extends LocationDataState {}

class LocationDataLoading extends LocationDataState {}

class LocationDataLoaded extends LocationDataState {
  final AirQualityData airQualityData;
  final WeatherData weatherData;

  LocationDataLoaded(this.airQualityData, this.weatherData);
}

class LocationDataError extends LocationDataState {
  final String message;
  LocationDataError(this.message);
}