// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'air_quality.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AirQuality _$AirQualityFromJson(Map<String, dynamic> json) => _AirQuality(
  aqi: (json['aqi'] as num).toInt(),
  co: (json['co'] as num).toDouble(),
  no2: (json['no2'] as num).toDouble(),
  o3: (json['o3'] as num).toDouble(),
  so2: (json['so2'] as num).toDouble(),
  pm10: (json['pm10'] as num).toDouble(),
  pm25: (json['pm25'] as num).toDouble(),
  forecast: (json['forecast'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList(),
);

Map<String, dynamic> _$AirQualityToJson(_AirQuality instance) =>
    <String, dynamic>{
      'aqi': instance.aqi,
      'co': instance.co,
      'no2': instance.no2,
      'o3': instance.o3,
      'so2': instance.so2,
      'pm10': instance.pm10,
      'pm25': instance.pm25,
      'forecast': instance.forecast,
    };
