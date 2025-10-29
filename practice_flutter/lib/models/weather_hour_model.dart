import 'package:json_annotation/json_annotation.dart';

part 'weather_hour_model.g.dart';

@JsonSerializable()
class WeatherHourModel {
  final String time;
  final double tempC;
  final String iconUrl;

  WeatherHourModel({
    required this.time,
    required this.tempC,
    required this.iconUrl,
  });

  factory WeatherHourModel.fromJson(Map<String, dynamic> json) {
    final cond = json['condition'] ?? {};
    return WeatherHourModel(
      time: json['time'] ?? '',
      tempC: (json['temp_c'] ?? 0).toDouble(),
      iconUrl: cond['icon'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => _$WeatherHourModelToJson(this);
}
