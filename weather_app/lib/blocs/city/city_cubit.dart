import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/models/city_data.dart';
import 'package:weather_app/services/air_quality_service.dart';
import 'package:weather_app/services/weather_service.dart';
import 'city_state.dart';

class CityCubit extends Cubit<CityState> {

    final AirQualityService airService;
    final WeatherService weatherService;

    CityCubit({
      required this.airService,
      required this.weatherService,
    }) : super(CityState());

    Future<void> loadCity(String cityName) async{
        emit(state.copyWith(isLoading: true, error: null));

        try{
            final weather = await weatherService.getWeather(cityName);
            final air = await airService.getAirQuality(cityName);            

            final cityData = CityData(airQuality: air, weather: weather);

            final updatedCities = Map<String, CityData>.from(state.citiesData);

            updatedCities[cityName] = cityData;

            emit(state.copyWith(isLoading: false, citiesData: updatedCities));
            
        } catch (e){
            emit(state.copyWith(isLoading: false, error: e.toString()));
        }
    }

}