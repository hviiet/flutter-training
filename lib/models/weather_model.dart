import 'package:flutter_application_1/models/forecast_day.dart';
import 'package:flutter_application_1/models/forecast_hour.dart';
import 'package:json_annotation/json_annotation.dart';
part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel {
  String? name;
  String? country;

  @JsonKey(name: "temp_c")
  double? temp;

  @JsonKey(name: "text")
  String? description;
  String? icon;

  @JsonKey(name: "feelslike_c")
  double? feelsLike;
  List<ForecastDay>? forecast;
  List<ForecastHour>? forecastHours;

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

  factory WeatherModel.fromJson(Map<String, dynamic> json) => _$WeatherModelFromJson(transformApiJson(json));
  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);

  // factory WeatherModel.fromJson(Map<String, dynamic> json) {
  //   var forecastDays = (json['forecast']['forecastday'] as List)
  //       .map((day) => ForecastDay.fromJson(day))
  //       .toList();

  //   var forecastHours = (json['forecast']['forecastday'][0]['hour'] as List)
  //       .map((hour) => ForecastHour.fromJson(hour))
  //       .toList();

  //   return WeatherModel(
  //     name: json['location']['name']??"",
  //     country: json['location']['country']??"",
  //     temp: json['current']['temp_c'] ?? 0,
  //     description: json['current']['condition']['text']??"",
  //     icon: json['current']['condition']['icon']??"",
  //     feelsLike: json['current']['feelslike_c'] ?? 0,
  //     forecast: forecastDays,
  //     forecastHours: forecastHours,
  //   );
  // }
}

Map<String, dynamic> transformApiJson(Map<String, dynamic> json){
  var forecastDays = (json['forecast']['forecastday'] as List)
        .map((day) => {
          "date": day['date']??"",
          "icon": day['day']['condition']['icon']??"",
          "maxtemp_c": day['day']['maxtemp_c']??0,
          "mintemp_c": day['day']['mintemp_c']??0,
          "avgtemp_c": day['day']['avgtemp_c']??0,
        })
        .toList();

    var forecastHours = (json['forecast']['forecastday'][0]['hour'] as List)
        .map((hour) => {
          "icon": hour['condition']?['icon']??"",
          "temp_c": hour['temp_c']??0,
          "time": hour['time']??"1970-01-01 00:00",
        })
        .toList();
    return {
      "name": json['location']['name']??"",
      "country": json['location']['country']??"",
      "temp_c": json['current']['temp_c'] ?? 0,
      "text": json['current']['condition']?['text']??"",
      "icon": json['current']['condition']?['icon']??"",
      "feelslike_c": json['current']['feelslike_c'] ?? 0,
      "forecast": forecastDays,
      "forecastHours": forecastHours,
    };
}

