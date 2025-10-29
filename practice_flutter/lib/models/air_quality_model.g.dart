// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'air_quality_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirQualityModel _$AirQualityModelFromJson(Map<String, dynamic> json) =>
    AirQualityModel(
      aqi: (json['aqi'] as num?)?.toInt(),
      o3: (json['o3'] as num?)?.toDouble(),
      pm10: (json['pm10'] as num?)?.toDouble(),
      no2: (json['no2'] as num?)?.toDouble(),
      no: (json['no'] as num?)?.toDouble(),
      so2: (json['so2'] as num?)?.toDouble(),
      co: (json['co'] as num?)?.toDouble(),
      pm25: (json['pm25'] as num?)?.toDouble(),
      forecast: (json['forecast'] as List<dynamic>?)
          ?.map((e) => AqiForecast.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AirQualityModelToJson(AirQualityModel instance) =>
    <String, dynamic>{
      'aqi': instance.aqi,
      'o3': instance.o3,
      'pm10': instance.pm10,
      'no2': instance.no2,
      'no': instance.no,
      'so2': instance.so2,
      'co': instance.co,
      'pm25': instance.pm25,
      'forecast': instance.forecast?.map((e) => e.toJson()).toList(),
    };

AqiForecast _$AqiForecastFromJson(Map<String, dynamic> json) => AqiForecast(
  day: json['day'] as String,
  avg: (json['avg'] as num).toDouble(),
  max: (json['max'] as num?)?.toDouble(),
  min: (json['min'] as num?)?.toDouble(),
);

Map<String, dynamic> _$AqiForecastToJson(AqiForecast instance) =>
    <String, dynamic>{
      'day': instance.day,
      'avg': instance.avg,
      'max': instance.max,
      'min': instance.min,
    };
