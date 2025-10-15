import 'package:equatable/equatable.dart';
import 'package:practice_flutter/models/air_quality_model.dart';
import 'package:practice_flutter/models/weather_model.dart';


class WeatherAqiState extends Equatable {
  @override
  List<Object?> get props => [];
}

class WeatherAqiInitial extends WeatherAqiState {}

class WeatherAqiLoading extends WeatherAqiState {}

class WeatherAqiLoaded extends WeatherAqiState {
  final WeatherModel weather;
  final AirQualityModel airQuality;
  final List<AqiForecast>? forecast;

  WeatherAqiLoaded({
    required this.weather,
    required this.airQuality,
    this.forecast,
  });

  @override
  List<Object?> get props => [weather, airQuality, forecast];
}

class WeatherAqiError extends WeatherAqiState {
  final String message;

  WeatherAqiError(this.message);

  @override
  List<Object?> get props => [message];
}
