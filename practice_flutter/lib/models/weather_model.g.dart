// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) => WeatherModel(
  location: json['location'] as String,
  tempC: (json['tempC'] as num).toDouble(),
  feelslikeC: (json['feelslikeC'] as num).toDouble(),
  conditionText: json['conditionText'] as String,
  iconUrl: json['iconUrl'] as String,
  hourly: (json['hourly'] as List<dynamic>)
      .map((e) => WeatherHourModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  forecastDays: (json['forecastDays'] as List<dynamic>)
      .map((e) => ForecastDayModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$WeatherModelToJson(WeatherModel instance) =>
    <String, dynamic>{
      'location': instance.location,
      'tempC': instance.tempC,
      'feelslikeC': instance.feelslikeC,
      'conditionText': instance.conditionText,
      'iconUrl': instance.iconUrl,
      'hourly': instance.hourly.map((e) => e.toJson()).toList(),
      'forecastDays': instance.forecastDays.map((e) => e.toJson()).toList(),
    };
