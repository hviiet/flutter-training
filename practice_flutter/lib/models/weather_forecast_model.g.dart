// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_forecast_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastDayModel _$ForecastDayModelFromJson(Map<String, dynamic> json) =>
    ForecastDayModel(
      date: DateTime.parse(json['date'] as String),
      maxTempC: (json['maxTempC'] as num).toDouble(),
      minTempC: (json['minTempC'] as num).toDouble(),
      conditionText: json['conditionText'] as String,
      iconUrl: json['iconUrl'] as String,
    );

Map<String, dynamic> _$ForecastDayModelToJson(ForecastDayModel instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'maxTempC': instance.maxTempC,
      'minTempC': instance.minTempC,
      'conditionText': instance.conditionText,
      'iconUrl': instance.iconUrl,
    };
