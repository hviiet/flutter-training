import 'package:flutter_training/models/weather_location.dart';

abstract class AqiScaleState {}

class AqiScaleInitial extends AqiScaleState {}

class AqiScaleLoading extends AqiScaleState {}

class AqiScaleLoaded extends AqiScaleState {
  final WeatherLocation weatherLocation;

  AqiScaleLoaded(this.weatherLocation);
}

class AqiScaleError extends AqiScaleState {
  final String message;

  AqiScaleError(this.message);
}