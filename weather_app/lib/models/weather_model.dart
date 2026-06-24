import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/models/weather_forecast_model.dart';
import 'package:weather_app/models/weather_hour_model.dart';

part 'weather_model.freezed.dart';

@freezed
abstract class WeatherModel with _$WeatherModel {
  const factory WeatherModel({
    required DateTime localTime,
    required String location,
    required double temp_c,
    required double feelslike_c,
    required String conditionText,
    required String conditionIcon,
    required List<WeatherForecastModel> forecast,
    required List<WeatherHourModel> hourlyForecast,
  }) = _WeatherModel;

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    // print("Parsing WeatherModel:");
    return WeatherModel(
      localTime: DateTime.parse(json['location']['localtime']),
      location: json['location']['name'],
      temp_c: json['current']['temp_c'].toDouble(),
      feelslike_c: json['current']['feelslike_c'].toDouble(),
      conditionText: json['current']['condition']['text']??'',
      conditionIcon: 'https:${json['current']['condition']['icon']??''}',
      forecast: (json['forecast']['forecastday'] as List)
          .map((item) => WeatherForecastModel.fromJson(item))
          .toList(),
      hourlyForecast: (json['forecast']['forecastday'][0]['hour'] as List)
          .map((item) => WeatherHourModel.fromJson(item))
          .toList(),
    );
  }

}