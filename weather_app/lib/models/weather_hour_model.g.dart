// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_hour_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WeatherHourModel _$WeatherHourModelFromJson(Map<String, dynamic> json) =>
    _WeatherHourModel(
      time: DateTime.parse(json['time'] as String),
      temp_c: (json['temp_c'] as num).toDouble(),
      condition: WeatherConditionModel.fromJson(
        json['condition'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$WeatherHourModelToJson(_WeatherHourModel instance) =>
    <String, dynamic>{
      'time': instance.time.toIso8601String(),
      'temp_c': instance.temp_c,
      'condition': instance.condition,
    };

_WeatherConditionModel _$WeatherConditionModelFromJson(
  Map<String, dynamic> json,
) => _WeatherConditionModel(
  text: json['text'] as String,
  icon: json['icon'] as String,
);

Map<String, dynamic> _$WeatherConditionModelToJson(
  _WeatherConditionModel instance,
) => <String, dynamic>{'text': instance.text, 'icon': instance.icon};
