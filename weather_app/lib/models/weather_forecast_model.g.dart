// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_forecast_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WeatherForecastModel _$WeatherForecastModelFromJson(
  Map<String, dynamic> json,
) => _WeatherForecastModel(
  date: DateTime.parse(json['date'] as String),
  day: WeatherDayModel.fromJson(json['day'] as Map<String, dynamic>),
);

Map<String, dynamic> _$WeatherForecastModelToJson(
  _WeatherForecastModel instance,
) => <String, dynamic>{
  'date': instance.date.toIso8601String(),
  'day': instance.day,
};

_WeatherDayModel _$WeatherDayModelFromJson(Map<String, dynamic> json) =>
    _WeatherDayModel(
      avgtemp_c: (json['avgtemp_c'] as num).toDouble(),
      maxtemp_c: (json['maxtemp_c'] as num).toDouble(),
      mintemp_c: (json['mintemp_c'] as num).toDouble(),
      condition: DayConditionModel.fromJson(
        json['condition'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$WeatherDayModelToJson(_WeatherDayModel instance) =>
    <String, dynamic>{
      'avgtemp_c': instance.avgtemp_c,
      'maxtemp_c': instance.maxtemp_c,
      'mintemp_c': instance.mintemp_c,
      'condition': instance.condition,
    };

_DayConditionModel _$DayConditionModelFromJson(Map<String, dynamic> json) =>
    _DayConditionModel(
      text: json['text'] as String,
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$DayConditionModelToJson(_DayConditionModel instance) =>
    <String, dynamic>{'text': instance.text, 'icon': instance.icon};
