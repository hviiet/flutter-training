

import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_forecast_model.freezed.dart';
part 'weather_forecast_model.g.dart';

@freezed
abstract class WeatherForecastModel with  _$WeatherForecastModel{
  const factory WeatherForecastModel({
    required DateTime date,
    required WeatherDayModel day,
  }) = _WeatherForecastModel;

  factory WeatherForecastModel.fromJson(Map<String, dynamic> json) 
    => _$WeatherForecastModelFromJson(json);
}

@freezed
abstract class WeatherDayModel with _$WeatherDayModel{
  const factory WeatherDayModel({
    required double avgtemp_c,
    required double maxtemp_c,
    required double mintemp_c,
    required DayConditionModel condition,
  }) = _WeatherDayModel;

  factory WeatherDayModel.fromJson(Map<String, dynamic> json) 
    => _$WeatherDayModelFromJson(json);
}

@freezed
abstract class DayConditionModel with _$DayConditionModel{
  const factory DayConditionModel({
    required String text,
    required String icon,
  }) = _DayConditionModel;

  factory DayConditionModel.fromJson(Map<String, dynamic> json) 
    => _$DayConditionModelFromJson(json);
}

// class WeatherForecastModel {
//   final DateTime date;
//   final double avgtemp_c;
//   final double maxtemp_c;
//   final double mintemp_c;
//   final String conditionText;
//   final String conditionIcon;

//   WeatherForecastModel({
//     required this.date,
//     required this.avgtemp_c,
//     required this.maxtemp_c,
//     required this.mintemp_c,
//     required this.conditionText,
//     required this.conditionIcon,
//   });

//   factory WeatherForecastModel.fromJson(Map<String, dynamic> json) {
//     // print("Parsing WeatherForecastModel:");
//     return WeatherForecastModel(
//       date: DateTime.parse(json['date']),
//       avgtemp_c: json['day']['avgtemp_c'].toDouble(),
//       maxtemp_c: json['day']['maxtemp_c'].toDouble(),
//       mintemp_c: json['day']['mintemp_c'].toDouble(),
//       conditionText: json['day']['condition']['text']??'',
//       conditionIcon: 'https:${json['day']['condition']['icon']}' ,
//     );
//   }

// }