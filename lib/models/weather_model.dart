import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_model.freezed.dart';

@freezed
class WeatherData with _$WeatherData {
  
  // 1. Chuyển constructor thành 'const factory'
  const factory WeatherData({
    required double currentTemp,
    required String condition,
    required double feelsLike,
    required List<HourlyForecast> hourlyForecast,
    required List<DailyForecast> dailyForecast,
  }) = _WeatherData;

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    var hourlyList = (json['forecast']['forecastday'][0]['hour'] as List)
        .map((hourJson) => HourlyForecast.fromJson(hourJson))
        .toList();

    var dailyList = (json['forecast']['forecastday'] as List)
        .map((dayJson) => DailyForecast.fromJson(dayJson))
        .toList();

    return WeatherData(
      currentTemp: (json['current']['temp_c'] ?? 0.0).toDouble(),
      condition: json['current']['condition']['text'] ?? '',
      feelsLike: (json['current']['feelslike_c'] ?? 0.0).toDouble(),
      hourlyForecast: hourlyList,
      dailyForecast: dailyList,
    );
  }
}

@freezed
class HourlyForecast with _$HourlyForecast {
  
  // 1. Chuyển constructor thành 'const factory'
  const factory HourlyForecast({
    required String time,
    required double temp,
    required String condition,
  }) = _HourlyForecast;

  factory HourlyForecast.fromJson(Map<String, dynamic> json) {
    String timeString = json['time'] ?? '00:00';
    String hour = timeString.split(' ')[1];

    return HourlyForecast(
      time: hour,
      temp: (json['temp_c'] ?? 0.0).toDouble(),
      condition: json['condition']['text'] ?? '',
    );
  }
}

@freezed
class DailyForecast with _$DailyForecast {
  
  // 1. Chuyển constructor thành 'const factory'
  const factory DailyForecast({
    required String date,
    required double maxTemp,
    required double minTemp,
    required String condition,
  }) = _DailyForecast;

  factory DailyForecast.fromJson(Map<String, dynamic> json) {
    return DailyForecast(
      date: json['date'] ?? '',
      maxTemp: (json['day']['maxtemp_c'] ?? 0.0).toDouble(),
      minTemp: (json['day']['mintemp_c'] ?? 0.0).toDouble(),
      condition: json['day']['condition']['text'] ?? '',
    );
  }
}