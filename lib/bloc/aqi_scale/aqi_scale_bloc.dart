import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/bloc/aqi_scale/aqi_scale_event.dart';
import 'package:flutter_training/bloc/aqi_scale/aqi_scale_state.dart';
import 'package:flutter_training/models/weather_location.dart';
import 'package:flutter_training/services/aqi_service.dart';
import 'package:flutter_training/services/weather_service.dart';

class AqiScaleBloc extends Bloc<AqiScaleEvent, AqiScaleState> {

  final WeatherService weatherService;
  final AqiService aqiService;

  AqiScaleBloc({required this.weatherService, required this.aqiService}) : super(AqiScaleInitial()) {
    on<LoadAqiScale>((event, emit) async {
      emit(AqiScaleLoading());

      try {
        final weatherJson = await weatherService.fetchWeatherData(event.cityName, 1);
        final aqiJson = await aqiService.fetchAqiData(event.cityName);

        final weatherLocation = WeatherLocation.fromMergedJson(weatherJson, aqiJson);
        emit(AqiScaleLoaded(weatherLocation));
        
      } catch (e) {
        emit(AqiScaleError('Failed to load AQI scale: ${e.toString()}'));
      }
    });
  }
}