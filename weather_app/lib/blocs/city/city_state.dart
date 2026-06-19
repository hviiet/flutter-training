import 'package:weather_app/models/city_data.dart';

class CityState {
  final bool isLoading;
  final String? error;

  final Map<String, CityData> citiesData;

  CityState({
    required this.isLoading,
    required this.error,
    required this.citiesData,
  });

  factory CityState.initial() {
    return CityState(
      isLoading: false,
      error: null,
      citiesData: {},
    );
  }

  CityState copyWith({
    bool? isLoading,
    String? error,
    Map<String, CityData>? citiesData,
  }) {
    return CityState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      citiesData: citiesData ?? this.citiesData,
    );
  }
}