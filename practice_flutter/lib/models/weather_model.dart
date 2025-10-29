import 'package:json_annotation/json_annotation.dart';
import 'weather_hour_model.dart';
import 'weather_forecast_model.dart';

part 'weather_model.g.dart';

@JsonSerializable(explicitToJson: true)
class WeatherModel {
  final String location; // vẫn giữ tên cũ
  final double tempC;
  final double feelslikeC;
  final String conditionText;
  final String iconUrl;
  final List<WeatherHourModel> hourly;
  final List<ForecastDayModel> forecastDays;

  WeatherModel({
    required this.location,
    required this.tempC,
    required this.feelslikeC,
    required this.conditionText,
    required this.iconUrl,
    required this.hourly,
    required this.forecastDays,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final loc = json['location']?['name'] ?? '';
    final current = json['current'] ?? {};
    final cond = current['condition'] ?? {};

    final forecastList =
        (json['forecast']?['forecastday'] as List<dynamic>? ?? [])
            .map((e) => ForecastDayModel.fromJson(e))
            .toList();

    final hourlyList =
        (json['forecast']?['forecastday']?[0]?['hour'] as List<dynamic>? ?? [])
            .map((e) => WeatherHourModel.fromJson(e))
            .toList();

    return WeatherModel(
      location: loc,
      tempC: (current['temp_c'] ?? 0).toDouble(),
      feelslikeC: (current['feelslike_c'] ?? 0).toDouble(),
      conditionText: cond['text'] ?? '',
      iconUrl: cond['icon'] ?? '',
      hourly: hourlyList,
      forecastDays: forecastList,
    );
  }

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}
