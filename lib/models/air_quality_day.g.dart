// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'air_quality_day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirQualityDay _$AirQualityDayFromJson(Map<String, dynamic> json) =>
    AirQualityDay(
      aqi: (json['aqi'] as num?)?.toInt(),
      date: json['date'] == null
          ? null
          : DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$AirQualityDayToJson(AirQualityDay instance) =>
    <String, dynamic>{
      'aqi': instance.aqi,
      'date': instance.date?.toIso8601String(),
    };
