import 'package:weather_app/models/weather_forecast_model.dart';
import 'package:weather_app/models/weather_hour_model.dart';

class WeatherModel {
  final DateTime localTime;
  final String location;
  final double temp_c;
  final double feelslike_c;
  final String conditionText;
  final String conditionIcon;
  final List<WeatherForecastModel> forecast;
  final List<WeatherHourModel> hourlyForecast;

  WeatherModel({
    required this.localTime,
    required this.location,
    required this.temp_c,
    required this.feelslike_c,
    required this.conditionText,
    required this.conditionIcon,
    required this.forecast,
    required this.hourlyForecast,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      localTime: DateTime.parse(json['location']['localtime']),
      location: json['location']['name'],
      temp_c: json['current']['temp_c'].toDouble(),
      feelslike_c: json['current']['feelslike_c'].toDouble(),
      conditionText: json['current']['condition']['text']??'',
      conditionIcon: 'https:${json['current']['condition']['icon']}' ?? '',
      forecast: (json['forecast']['forecastday'] as List)
          .map((item) => WeatherForecastModel.fromJson(item))
          .toList(),
      hourlyForecast: (json['forecast']['forecastday'][0]['hour'] as List)
          .map((item) => WeatherHourModel.fromJson(item))
          .toList(),
    );
  }

}