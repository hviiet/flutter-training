import 'package:equatable/equatable.dart';
import '../../models/weather_model.dart';
import '../../models/air_quality_model.dart';
import '../../models/weather_hour_model.dart';
import '../../models/weather_forecast_model.dart'; // thêm dòng này

abstract class WeatherAqiState extends Equatable {
  const WeatherAqiState();

  @override
  List<Object?> get props => [];
}

class WeatherAqiInitial extends WeatherAqiState {}

class WeatherAqiLoading extends WeatherAqiState {}

class WeatherAqiLoaded extends WeatherAqiState {
  final WeatherModel weather;
  final AirQualityModel airQuality;
  final List<WeatherHourModel> hourlyForecast;
  final List<ForecastDayModel> forecastDays; // <-- thêm 

  const WeatherAqiLoaded({
    required this.weather,
    required this.airQuality,
    required this.hourlyForecast,
    required this.forecastDays,
  });

  @override
  List<Object?> get props => [
    weather,
    airQuality,
    hourlyForecast,
    forecastDays,
  ];
}

class WeatherAqiError extends WeatherAqiState {
  final String message;
  const WeatherAqiError(this.message);

  @override
  List<Object?> get props => [message];
}
