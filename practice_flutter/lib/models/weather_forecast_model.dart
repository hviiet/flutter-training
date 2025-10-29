import 'package:json_annotation/json_annotation.dart';
part 'weather_forecast_model.g.dart';

@JsonSerializable()
class ForecastDayModel {
  final DateTime date;
  final double maxTempC;
  final double minTempC;
  final String conditionText;
  final String iconUrl;

  ForecastDayModel({
    required this.date,
    required this.maxTempC,
    required this.minTempC,
    required this.conditionText,
    required this.iconUrl,
  });

  factory ForecastDayModel.fromJson(Map<String, dynamic> json) {
    final day = json['day'] ?? {};
    final cond = day['condition'] ?? {};
    return ForecastDayModel(
      date: DateTime.parse(json['date']),
      maxTempC: (day['maxtemp_c'] ?? 0).toDouble(),
      minTempC: (day['mintemp_c'] ?? 0).toDouble(),
      conditionText: cond['text'] ?? '',
      iconUrl: cond['icon'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => _$ForecastDayModelToJson(this);
}
