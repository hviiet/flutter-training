import 'package:dio/dio.dart';
import 'package:flutter_application_1/event/fetch_weather.dart';
import 'package:flutter_application_1/models/air_quality_model.dart';
import 'package:flutter_application_1/models/weather_model.dart';
import 'package:flutter_application_1/providers_and_state/weather_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState>{
  WeatherBloc(): super(WeatherInitial()){
    on<FetchWeatherAndAirQuality>(fetchBoth);
  }

  Future<void> fetchBoth(FetchWeatherAndAirQuality event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());
    try {
      final results = await Future.wait([
        Dio().get(
          "http://api.weatherapi.com/v1/forecast.json"
          "?key=${event.weatherKey}"
          "&q=${event.cityName}"
          "&days=${event.days}"
          "&aqi=${event.aqi}"
          "&alerts=${event.alerts}",
        ),
        Dio().get(
          "https://api.waqi.info/feed/${event.cityName}/?token=${event.aqiKey}",
        ),
      ]);

      final weatherResponse = results[0];
      final aqiResponse = results[1];

      if(weatherResponse.statusCode == 200 && aqiResponse.statusCode == 200){
        final weather = WeatherModel.fromJson(weatherResponse.data);
        final airQuality = AirQualityModel.fromJson(aqiResponse.data);
        emit(WeatherLoaded(weather: weather, airQuality: airQuality));
      }
      else{
        emit(WeatherError(message: "Failed to fetch weather data"));
      }
    } catch (e) {
      emit(WeatherError(message: e.toString()));
    }
  }
}