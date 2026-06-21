import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/models/weather_location.dart';
import 'location_detail_event.dart';
import 'location_detail_state.dart';
import '../../services/weather_service.dart';
import '../../services/aqi_service.dart';
import '../../models/location_detail_data.dart';

class LocationDetailBloc extends Bloc<LocationDetailEvent, LocationDetailState> {
  final WeatherService weatherService;
  final AqiService aqiService;

  LocationDetailBloc({required this.weatherService, required this.aqiService}) : super(LocationDetailInitial()) {
    on<LoadLocationDetailEvent>((event, emit) async {
      emit(LocationDetailLoading());

      try {
        final weatherJson = await weatherService.fetchWeatherData(event.cityName, 7);
        final aqiJson = await aqiService.fetchAqiData(event.cityName);

        final locationData = WeatherLocation.fromMergedJson(weatherJson, aqiJson);
        final pollutantData = _parsePollutantData(aqiJson);
        final hourlyForecasts = _parseHourlyForecast(weatherJson);
        final dailyAqiForecasts = _parseDailyAqiForecast(aqiJson);
        final dailyWeatherForecasts = _parseDailyWeatherForecast(weatherJson);
        final locationDetailData = LocationDetailData(
          location: locationData,
          pollutants: pollutantData,
          hourlyForecasts: hourlyForecasts,
          dailyAqiForecasts: dailyAqiForecasts,
          dailyWeatherForecasts: dailyWeatherForecasts,
        );
        emit(LocationDetailLoaded(locationDetailData));
      } catch (e) {
        emit(LocationDetailError('Failed to load location details: ${e.toString()}'));
      }
    });
  }

  List<Pollutant> _parsePollutantData(Map<String, dynamic> aqiJson) {
    final pollutants = aqiJson['data']['iaqi'] as Map<String, dynamic>;

    return [
      Pollutant.fromJson('PM25', pollutants),
      Pollutant.fromJson('O3', pollutants),
      Pollutant.fromJson('NO2', pollutants),
      Pollutant.fromJson('CO', pollutants),
      Pollutant.fromJson('SO2', pollutants),
      Pollutant.fromJson('PM10', pollutants),
    ];
  }

  List<HourlyWeatherForecastItem> _parseHourlyForecast(Map<String, dynamic> weatherJson) {
    final hourlyWeatherData = weatherJson['forecast']['forecastday'][0]['hour'] as List<dynamic>?;
    
    if (hourlyWeatherData == null) {
      return [];
    }
    return hourlyWeatherData.map((hourJson) => HourlyWeatherForecastItem.fromJson(hourJson)).toList();
      
  }
  
  List<DailyAqiForecastItem> _parseDailyAqiForecast(Map<String, dynamic> aqiJson) {
    final dailyAqiData = aqiJson['data']['forecast']['daily']['pm25'] as List<dynamic>?;
   
    if (dailyAqiData == null) {
      return [];
    }

    dailyAqiData.removeAt(0);

    return dailyAqiData.map((aqiDayJson) => DailyAqiForecastItem.fromJson(aqiDayJson)).toList();
  }

  List<DailyWeatherForecastItem> _parseDailyWeatherForecast(Map<String, dynamic> weatherJson) {
    final dailyWeatherData = weatherJson['forecast']['forecastday'] as List<dynamic>?;

    if (dailyWeatherData == null) {
      return [];
    }
    return dailyWeatherData.map((dayJson) => DailyWeatherForecastItem.fromJson(dayJson)).toList();
  }
}