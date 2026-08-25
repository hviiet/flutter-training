// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WeatherHour _$WeatherHourFromJson(Map<String, dynamic> json) => _WeatherHour(
  time: json['time'] as String,
  temperature: (json['temperature'] as num).toDouble(),
  condition: json['condition'] as String,
  iconUrl: json['iconUrl'] as String,
);

Map<String, dynamic> _$WeatherHourToJson(_WeatherHour instance) =>
    <String, dynamic>{
      'time': instance.time,
      'temperature': instance.temperature,
      'condition': instance.condition,
      'iconUrl': instance.iconUrl,
    };

_WeatherDay _$WeatherDayFromJson(Map<String, dynamic> json) => _WeatherDay(
  date: json['date'] as String,
  maxTemp: (json['maxTemp'] as num).toDouble(),
  minTemp: (json['minTemp'] as num).toDouble(),
  condition: json['condition'] as String,
  iconUrl: json['iconUrl'] as String,
);

Map<String, dynamic> _$WeatherDayToJson(_WeatherDay instance) =>
    <String, dynamic>{
      'date': instance.date,
      'maxTemp': instance.maxTemp,
      'minTemp': instance.minTemp,
      'condition': instance.condition,
      'iconUrl': instance.iconUrl,
    };

_Weather _$WeatherFromJson(Map<String, dynamic> json) => _Weather(
  locationName: json['locationName'] as String,
  region: json['region'] as String,
  temperature: (json['temperature'] as num).toDouble(),
  feelsLike: (json['feelsLike'] as num).toDouble(),
  condition: json['condition'] as String,
  iconUrl: json['iconUrl'] as String,
  forecast: (json['forecast'] as List<dynamic>)
      .map((e) => WeatherDay.fromJson(e as Map<String, dynamic>))
      .toList(),
  hourlyForecast: (json['hourlyForecast'] as List<dynamic>)
      .map((e) => WeatherHour.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$WeatherToJson(_Weather instance) => <String, dynamic>{
  'locationName': instance.locationName,
  'region': instance.region,
  'temperature': instance.temperature,
  'feelsLike': instance.feelsLike,
  'condition': instance.condition,
  'iconUrl': instance.iconUrl,
  'forecast': instance.forecast,
  'hourlyForecast': instance.hourlyForecast,
};
