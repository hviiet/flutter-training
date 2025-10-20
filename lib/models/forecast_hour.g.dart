// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_hour.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastHour _$ForecastHourFromJson(Map<String, dynamic> json) => ForecastHour(
  icon: json['icon'] as String?,
  temp: (json['temp_c'] as num?)?.toDouble(),
  time: json['time'] == null ? null : DateTime.parse(json['time'] as String),
);

Map<String, dynamic> _$ForecastHourToJson(ForecastHour instance) =>
    <String, dynamic>{
      'icon': instance.icon,
      'temp_c': instance.temp,
      'time': instance.time?.toIso8601String(),
    };
