import 'package:weather_app/models/weather_forecast_model.dart';
import 'package:weather_app/models/weather_hour_model.dart';

extension WeatherConditionModelExtension on WeatherConditionModel {
  String get conditionIconUrl => 'https:$icon';
}

extension DayConditionModelExtension on DayConditionModel {
  String get conditionIconUrl => 'https:$icon';
}