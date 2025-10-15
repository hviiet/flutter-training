import 'package:equatable/equatable.dart';

abstract class WeatherAqiEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchWeatherAqi extends WeatherAqiEvent {
  final String city;
  FetchWeatherAqi(this.city);

  @override
  List<Object?> get props => [city];
}
