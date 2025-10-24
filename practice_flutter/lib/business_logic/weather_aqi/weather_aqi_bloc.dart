import 'package:flutter_bloc/flutter_bloc.dart';
import 'weather_aqi_event.dart';
import 'weather_aqi_state.dart';
import '../../services/weather_service.dart';
import '../../services/air_service.dart';
import '../../models/weather_hour_model.dart';
import '../../models/weather_model.dart';
import '../../models/air_quality_model.dart';
import '../../models/weather_forecast_model.dart'; // <--- thêm dòng này

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
      // --- Gọi API thời tiết (hiện tại + theo giờ + 7 ngày) ---
      final weatherMap = await weatherService.fetchWeatherFull(
        event.city,
        'aa91026d9e2e4675bde101825251410',
      );

      final WeatherModel weatherData = weatherMap['current'];
      final List<WeatherHourModel> hourlyForecast = weatherMap['hourly'];
      final List<ForecastDayModel> forecastDays = weatherMap['forecast'];

      // --- Gọi API chất lượng không khí ---
      final airQualityData = await airService.fetchAirQuality(
        event.city,
        '8404143559d5ac1eaedd8b1c3f2258ae8b11977d',
      );

      // --- Emit state ---
      emit(
        WeatherAqiLoaded(
          weather: weatherData,
          airQuality: airQualityData,
          hourlyForecast: hourlyForecast,
          forecastDays: forecastDays, // <-- thêm dữ liệu 7 ngày vào state
        ),
      );
    } catch (e) {
      emit(WeatherAqiError('Error: $e'));
    }
  }
}
