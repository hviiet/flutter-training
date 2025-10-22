import 'package:equatable/equatable.dart';
import 'package:flutter_training/models/weather_data.dart';

// Events
abstract class LocationDetailsEvent extends Equatable {
  const LocationDetailsEvent();

  @override
  List<Object?> get props => [];
}

class LoadLocationDetails extends LocationDetailsEvent {
  final String location;

  const LoadLocationDetails({required this.location});

  @override
  List<Object?> get props => [location];
}

class RefreshLocationDetails extends LocationDetailsEvent {
  final String location;

  const RefreshLocationDetails({required this.location});

  @override
  List<Object?> get props => [location];
}

// States
abstract class LocationDetailsState extends Equatable {
  const LocationDetailsState();

  @override
  List<Object?> get props => [];
}

class LocationDetailsInitial extends LocationDetailsState {}

class LocationDetailsLoading extends LocationDetailsState {}

class LocationDetailsLoaded extends LocationDetailsState {
  final WeatherData weatherData;

  const LocationDetailsLoaded({
    required this.weatherData,
  });

  @override
  List<Object?> get props => [weatherData];
}

class LocationDetailsError extends LocationDetailsState {
  final String message;

  const LocationDetailsError({required this.message});

  @override
  List<Object?> get props => [message];
}
