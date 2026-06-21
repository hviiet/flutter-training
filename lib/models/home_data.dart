import 'weather_location.dart';
import '../../core/extension/date_extension.dart';

class HomeForecastItem {
  final String day;
  final int aqi;
  final double avgTemp;
  final String conditionIcon;

  HomeForecastItem({
    required this.day,
    required this.aqi,
    required this.avgTemp,
    required this.conditionIcon,
  });

  factory HomeForecastItem.fromMergedJson(Map<String, dynamic> weatherDayJson, Map<String, dynamic> aqiDayJson) {
    final dayData = weatherDayJson['day'] ?? {};
    final condition = dayData['condition'] ?? {};

    return HomeForecastItem(
      day: (weatherDayJson['date'] as String).toShortDayofWeek,
      aqi: aqiDayJson['avg'] ?? 0,
      avgTemp: (dayData['avgtemp_c'] as num?)?.toDouble() ?? 0.0,
      conditionIcon: 'https:${condition['icon']}',
    );
  }
}

class HomeData {
  final WeatherLocation mainLocation;
  final List<WeatherLocation> smallLocations;
  final List<WeatherLocation> largeLocations;
  final List<HomeForecastItem> forecasts;

  HomeData({
    required this.mainLocation,
    required this.smallLocations,
    required this.largeLocations,
    required this.forecasts,
  });
}