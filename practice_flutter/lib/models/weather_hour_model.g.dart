// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_hour_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherHourModel _$WeatherHourModelFromJson(Map<String, dynamic> json) =>
    WeatherHourModel(
      time: json['time'] as String,
      tempC: (json['tempC'] as num).toDouble(),
      iconUrl: json['iconUrl'] as String,
    );

Map<String, dynamic> _$WeatherHourModelToJson(WeatherHourModel instance) =>
    <String, dynamic>{
      'time': instance.time,
      'tempC': instance.tempC,
      'iconUrl': instance.iconUrl,
    };
