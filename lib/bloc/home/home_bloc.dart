import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';
import '../../services/weather_service.dart';
import '../../services/aqi_service.dart';
import '../../models/home_data.dart';
import '../../models/weather_location.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final WeatherService weatherService;
  final AqiService aqiService;

  HomeBloc({required this.weatherService, required this.aqiService}) : super(HomeInitial()){
    on<LoadHomeDataEvent>((event, emit) async {
      emit(HomeLoading());

      try{
        final mainCity = 'Shanghai';
        final smallCities = ['London', 'Manchester'];
        final largeCites = ['Liverpool', 'Leeds'];

        final mainWeatherJson = await weatherService.fetchWeatherData(mainCity, 7);
        final mainAqiJdon = await aqiService.fetchAqiData(mainCity);

        final mainLocationData = WeatherLocation.fromMergedJson(mainWeatherJson, mainAqiJdon);
        
        final forecastData = _parseForecastData(mainWeatherJson, mainAqiJdon);

        final smallLocationsData = await Future.wait(smallCities.map((city) => _fetchLocationDataToday(city)));
        final largeLocationsData = await Future.wait(largeCites.map((city) => _fetchLocationDataToday(city)));

        final homeData = HomeData(
          mainLocation: mainLocationData,
          smallLocations: smallLocationsData,
          largeLocations: largeLocationsData,
          forecasts: forecastData,
        );

        emit(HomeLoaded(homeData));
      } catch (e) {
        emit(HomeError('Failed to load home data: ${e.toString()}'));
      }
    });

  }

  Future<WeatherLocation> _fetchLocationDataToday(String cityName) async {
    final weatherJson = await weatherService.fetchWeatherData(cityName, 1);
    final aqiJson = await aqiService.fetchAqiData(cityName);

    return WeatherLocation.fromMergedJson(weatherJson, aqiJson);
  }

  List<HomeForecastItem> _parseForecastData(Map<String, dynamic> weatherJson, Map<String, dynamic> aqiJson) {
    try{

      final weatherForecast = weatherJson['forecast']['forecastday'] as List<dynamic>;
      final aqiForecast = aqiJson['data']['forecast']['daily']['pm25'] as List<dynamic>?;

      return weatherForecast.map((weatherDayJson) {
        final date = weatherDayJson['date'] ?? '';
        final aqiDayJson = aqiForecast?.firstWhere((aqiDay) => aqiDay['day'] == date);
        return HomeForecastItem.fromMergedJson(weatherDayJson, aqiDayJson ?? {});
      }).toList();
    } catch (e) {
      return [];
    }
  }


}