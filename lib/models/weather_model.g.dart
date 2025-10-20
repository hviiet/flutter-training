// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) => WeatherModel(
  name: json['name'] as String?,
  country: json['country'] as String?,
  temp: (json['temp_c'] as num?)?.toDouble(),
  description: json['text'] as String?,
  icon: json['icon'] as String?,
  feelsLike: (json['feelslike_c'] as num?)?.toDouble(),
  forecast: (json['forecast'] as List<dynamic>?)
      ?.map((e) => ForecastDay.fromJson(e as Map<String, dynamic>))
      .toList(),
  forecastHours: (json['forecastHours'] as List<dynamic>?)
      ?.map((e) => ForecastHour.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$WeatherModelToJson(WeatherModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'country': instance.country,
      'temp_c': instance.temp,
      'text': instance.description,
      'icon': instance.icon,
      'feelslike_c': instance.feelsLike,
      'forecast': instance.forecast,
      'forecastHours': instance.forecastHours,
    };
