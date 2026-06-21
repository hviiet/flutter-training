import 'package:flutter_training/core/extension/date_extension.dart';
import 'package:flutter_training/models/weather_location.dart';

class Pollutant {
  final String name;
  final double value;

  Pollutant({
    required this.name,
    required this.value,
  });

  factory Pollutant.fromJson(String name, Map<String, dynamic> iaqiJson) {
    if (iaqiJson.containsKey(name.toLowerCase()) && iaqiJson[name.toLowerCase()]['v'] != null) {
      return Pollutant(
        name: name,
        value: (iaqiJson[name.toLowerCase()]['v'] as num).toDouble(),
      );
    } else {
      return Pollutant(
        name: name,
        value: 0.0,
      );
    }
  }
}

class HourlyWeatherForecastItem {
  final String time;
  final double temp;
  final String conditionIcon;

  HourlyWeatherForecastItem({
    required this.time,
    required this.temp,
    required this.conditionIcon,
  });

  factory HourlyWeatherForecastItem.fromJson(Map<String, dynamic> weatherHourJson) {
    final condition = weatherHourJson['condition'] ?? {};
    final timeStr = weatherHourJson['time'] ?? '';
    final parsedTime = timeStr.length > 11 ? timeStr.substring(11) : timeStr;

    return HourlyWeatherForecastItem(
      time: parsedTime,
      temp: (weatherHourJson['temp_c'] as num?)?.toDouble() ?? 0.0,
      conditionIcon: 'https:${condition['icon']}',
    );
  }
}

class DailyAqiForecastItem {
  final String date;
  final int aqi;

  DailyAqiForecastItem({
    required this.date,
    required this.aqi,
  });

  factory DailyAqiForecastItem.fromJson(Map<String, dynamic> aqiDayJson) {
    return DailyAqiForecastItem(
      date: (aqiDayJson['day'] as String).toShortDayofWeek,
      aqi: aqiDayJson['avg'] ?? 0,
    );
  }
}

class DailyWeatherForecastItem {
  final String date;
  final double maxTemp;
  final double minTemp;
  final String conditionIcon;

  DailyWeatherForecastItem({
    required this.date,
    required this.maxTemp,
    required this.minTemp,
    required this.conditionIcon,
  });

  factory DailyWeatherForecastItem.fromJson(Map<String, dynamic> weatherDayJson) {
    final dayData = weatherDayJson['day'] ?? {};
    final condition = dayData['condition'] ?? {};

    return DailyWeatherForecastItem(
      date: weatherDayJson['date'] ?? '',
      maxTemp: (dayData['maxtemp_c'] as num?)?.toDouble() ?? 0.0,
      minTemp: (dayData['mintemp_c'] as num?)?.toDouble() ?? 0.0,
      conditionIcon: 'https:${condition['icon']}',
    );
  }
}

class LocationDetailData {
  final WeatherLocation location;
  final List<Pollutant> pollutants;
  final List<HourlyWeatherForecastItem> hourlyForecasts;
  final List<DailyAqiForecastItem> dailyAqiForecasts;
  final List<DailyWeatherForecastItem> dailyWeatherForecasts;

  LocationDetailData({
    required this.location,
    required this.pollutants,
    required this.hourlyForecasts,
    required this.dailyAqiForecasts,
    required this.dailyWeatherForecasts,
  });
}