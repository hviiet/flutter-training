import 'package:flutter_application_1/models/forecast_day.dart';
import 'package:flutter_application_1/models/forecast_hour.dart';

class WeatherModel {
  String name;
  String country;
  double temp;
  String description;
  String icon;
  double feelsLike;
  List<ForecastDay> forecast;
  List<ForecastHour> forecastHours;

  WeatherModel({
    required this.name,
    required this.country,
    required this.temp,
    required this.description,
    required this.icon,
    required this.feelsLike,
    required this.forecast,
    required this.forecastHours,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    var forecastDays = (json['forecast']['forecastday'] as List)
        .map((day) => ForecastDay.fromJson(day))
        .toList();

    var forecastHours = (json['forecast']['forecastday'][0]['hour'] as List)
        .map((hour) => ForecastHour.fromJson(hour))
        .toList();

    return WeatherModel(
      name: json['location']['name']??"",
      country: json['location']['country']??"",
      temp: json['current']['temp_c'] ?? 0,
      description: json['current']['condition']['text']??"",
      icon: json['current']['condition']['icon']??"",
      feelsLike: json['current']['feelslike_c'] ?? 0,
      forecast: forecastDays,
      forecastHours: forecastHours,
    );
  }
}

