import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather.freezed.dart';
part 'weather.g.dart';

@freezed
abstract class WeatherHour with _$WeatherHour {
  const factory WeatherHour({
    required String time,
    required double temperature,
    required String condition,
    required String iconUrl,
  }) = _WeatherHour;
  factory WeatherHour.fromJson(Map<String, dynamic> json) =>
      _$WeatherHourFromJson(_weatherHourJson(json));
}

@freezed
abstract class WeatherDay with _$WeatherDay {
  const factory WeatherDay({
    required String date,
    required double maxTemp,
    required double minTemp,
    required String condition,
    required String iconUrl,
  }) = _WeatherDay;
  factory WeatherDay.fromJson(Map<String, dynamic> json) =>
      _$WeatherDayFromJson(_weatherDayJson(json));
}

@freezed
abstract class Weather with _$Weather {
  const factory Weather({
    required String locationName,
    required String region,
    required double temperature,
    required double feelsLike,
    required String condition,
    required String iconUrl,
    required List<WeatherDay> forecast,
    required List<WeatherHour> hourlyForecast,
  }) = _Weather;
  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(_weatherJson(json));
}

Map<String, dynamic> _weatherHourJson(Map<String, dynamic> json) {
  if (json.containsKey('temperature')) return json;
  final condition = _asMap(json['condition']);
  return {
    'time': json['time']?.toString() ?? '',
    'temperature': (json['temp_c'] as num?)?.toDouble() ?? 0,
    'condition': condition['text']?.toString() ?? '',
    'iconUrl': _normalizeIcon(condition['icon']?.toString() ?? ''),
  };
}

Map<String, dynamic> _weatherDayJson(Map<String, dynamic> json) {
  if (json.containsKey('maxTemp')) return json;
  final day = _asMap(json['day']);
  final condition = _asMap(day['condition']);
  return {
    'date': json['date']?.toString() ?? '',
    'maxTemp': (day['maxtemp_c'] as num?)?.toDouble() ?? 0,
    'minTemp': (day['mintemp_c'] as num?)?.toDouble() ?? 0,
    'condition': condition['text']?.toString() ?? '',
    'iconUrl': _normalizeIcon(condition['icon']?.toString() ?? ''),
  };
}

Map<String, dynamic> _weatherJson(Map<String, dynamic> json) {
  if (json.containsKey('locationName')) return json;
  final location = _asMap(json['location']);
  final current = _asMap(json['current']);
  final condition = _asMap(current['condition']);
  final forecastDays = _asList(_asMap(json['forecast'])['forecastday']);
  final firstDay = forecastDays.isEmpty
      ? <String, dynamic>{}
      : _asMap(forecastDays.first);
  return {
    'locationName': location['name']?.toString() ?? '',
    'region': (location['region'] ?? location['country'])?.toString() ?? '',
    'temperature': (current['temp_c'] as num?)?.toDouble() ?? 0,
    'feelsLike': (current['feelslike_c'] as num?)?.toDouble() ?? 0,
    'condition': condition['text']?.toString() ?? '',
    'iconUrl': _normalizeIcon(condition['icon']?.toString() ?? ''),
    'forecast': forecastDays
        .map((item) => _weatherDayJson(_asMap(item)))
        .toList(),
    'hourlyForecast': _asList(
      firstDay['hour'],
    ).map((item) => _weatherHourJson(_asMap(item))).toList(),
  };
}

Map<String, dynamic> _asMap(Object? value) =>
    value is Map ? Map<String, dynamic>.from(value) : <String, dynamic>{};
List<dynamic> _asList(Object? value) => value is List ? value : const [];
String _normalizeIcon(String url) => url.startsWith('//') ? 'https:$url' : url;
