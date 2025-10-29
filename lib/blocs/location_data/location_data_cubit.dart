import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:air_quality/services/weather_api_service.dart';
import 'package:air_quality/models/air_quality_model.dart';
import 'package:air_quality/models/weather_model.dart';
import 'location_data_state.dart';

class LocationDataCubit extends Cubit<LocationDataState> {
  final WeatherApiService _weatherApiService;

  LocationDataCubit(this._weatherApiService) : super(const LocationDataState.initial());

  void fetchData(String city) async {
    try {
      emit(const LocationDataState.loading());

      final results = await Future.wait([
        _weatherApiService.getAirQualityData(city),
        _weatherApiService.getWeatherData(city),
      ]);

      final airQualityData = results[0] as AirQualityData;
      final weatherData = results[1] as WeatherData;

      emit(LocationDataState.loaded(
        airQualityData: airQualityData,
        weatherData: weatherData,
      ));
    } catch (e) {
      emit(LocationDataState.error(message: 'Không thể tải dữ liệu: ${e.toString()}'));
    }
  }
}