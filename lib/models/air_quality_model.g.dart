// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'air_quality_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirQualityModel _$AirQualityModelFromJson(Map<String, dynamic> json) =>
    AirQualityModel(
      co: (json['co'] as num?)?.toDouble(),
      no2: (json['no2'] as num?)?.toDouble(),
      o3: (json['o3'] as num?)?.toDouble(),
      so2: (json['so2'] as num?)?.toDouble(),
      pm25: (json['pm25'] as num?)?.toDouble(),
      pm10: (json['pm10'] as num?)?.toDouble(),
      index: (json['index'] as num?)?.toInt(),
      aqiDays: (json['aqiDays'] as List<dynamic>?)
          ?.map((e) => AirQualityDay.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AirQualityModelToJson(AirQualityModel instance) =>
    <String, dynamic>{
      'co': instance.co,
      'no2': instance.no2,
      'o3': instance.o3,
      'so2': instance.so2,
      'pm25': instance.pm25,
      'pm10': instance.pm10,
      'index': instance.index,
      'aqiDays': instance.aqiDays?.map((e) => e.toJson()).toList(),
    };
