import 'package:flutter_bloc/flutter_bloc.dart';
import 'weather_aqi_event.dart';
import 'weather_aqi_state.dart';
import '../../services/weather_service.dart';
import '../../services/air_service.dart';

class WeatherAqiBloc extends Bloc<WeatherAqiEvent, WeatherAqiState> {
  final WeatherService weatherService;
  final AirService airService;

  WeatherAqiBloc({required this.weatherService, required this.airService})
    : super(WeatherAqiInitial()) {
    on<FetchWeatherAqi>(_onFetchWeatherAqi);
  }

  Future<void> _onFetchWeatherAqi(
    FetchWeatherAqi event,
    Emitter<WeatherAqiState> emit,
  ) async {
    emit(WeatherAqiLoading());
    try {
      
      final weatherData = await weatherService.fetchWeather(
        event.city,
        'aa91026d9e2e4675bde101825251410',
      );

      
      final airQualityData = await airService.fetchAirQuality(
        event.city,
        '8404143559d5ac1eaedd8b1c3f2258ae8b11977d', 
      );

      
      emit(WeatherAqiLoaded(weather: weatherData, airQuality: airQualityData));
    } catch (e) {
      emit(WeatherAqiError('Error: $e'));
    }
  }
}
