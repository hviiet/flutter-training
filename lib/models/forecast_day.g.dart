// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastDay _$ForecastDayFromJson(Map<String, dynamic> json) => ForecastDay(
  date: json['date'] as String?,
  icon: json['icon'] as String?,
  maxTemp: (json['maxtemp_c'] as num?)?.toDouble(),
  minTemp: (json['mintemp_c'] as num?)?.toDouble(),
  avgTemp: (json['avgtemp_c'] as num?)?.toDouble(),
);

Map<String, dynamic> _$ForecastDayToJson(ForecastDay instance) =>
    <String, dynamic>{
      'date': instance.date,
      'icon': instance.icon,
      'maxtemp_c': instance.maxTemp,
      'mintemp_c': instance.minTemp,
      'avgtemp_c': instance.avgTemp,
    };
