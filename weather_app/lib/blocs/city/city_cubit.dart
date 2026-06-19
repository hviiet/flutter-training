import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/models/air_quality_model.dart';
import 'package:weather_app/models/city_data.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/air_quality_service.dart';
import 'package:weather_app/services/weather_service.dart';
import 'city_state.dart';

class CityCubit extends Cubit<CityState> {

    final AirQualityService airService;
    final WeatherService weatherService;

    CityCubit({
      required this.airService,
      required this.weatherService,
    }) : super(CityState.initial());

    Future<void> loadCity(String cityName) async{
        emit(state.copyWith(isLoading: true, error: null));

        try{
            final weatherJson = await weatherService.getWeather(cityName);
            final airJson = await airService.getAirQuality(cityName);

            final weather = WeatherModel.fromJson(weatherJson);
            final air = AirQualityModel.fromJson(airJson);

            final cityData = CityData(airQuality: air, weather: weather);

            final updatedCities = Map<String, CityData>.from(state.citiesData);

            updatedCities[cityName] = cityData;

            emit(state.copyWith(isLoading: false, citiesData: updatedCities));
            
        } catch (e){
            emit(state.copyWith(isLoading: false, error: e.toString()));
        }
    }

}