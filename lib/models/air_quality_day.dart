
import 'package:json_annotation/json_annotation.dart';
part 'air_quality_day.g.dart';

@JsonSerializable()
class AirQualityDay {
  final int? aqi;
  final DateTime? date;

  AirQualityDay({
    required this.aqi,
    required this.date,
  });

  factory AirQualityDay.fromJson(Map<String, dynamic> json) => _$AirQualityDayFromJson(json);
  Map<String, dynamic> toJson()=> _$AirQualityDayToJson(this);
}