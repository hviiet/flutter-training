import 'package:flutter_application_1/models/air_quality_day.dart';
import 'package:json_annotation/json_annotation.dart';
part 'air_quality_model.g.dart';

@JsonSerializable(explicitToJson: true)
class AirQualityModel {
  final double? co;
  final double? no2;
  final double? o3;
  final double? so2;
  final double? pm25;
  final double? pm10;
  final int? index;
  final List<AirQualityDay>? aqiDays;

  AirQualityModel({
    required this.co,
    required this.no2,
    required this.o3,
    required this.so2,
    required this.pm25,
    required this.pm10,
    required this.index,
    required this.aqiDays,
  });

  

  factory AirQualityModel.fromJson(Map<String, dynamic> json) => _$AirQualityModelFromJson(transformApiJson(json));
  Map<String, dynamic> toJson() => _$AirQualityModelToJson(this);

  

  // factory AirQualityModel.fromJson(Map<String, dynamic> json) {
  //   final data = json['data'] ?? {};

  //   int scaleAQI(int rawAqi) {
  //     double scaled = (rawAqi / 500) * 6 + 1;
  //     return scaled.round().clamp(1, 7);
  //   }

  //   final List<dynamic> pm25Forecast =
  //       (data['forecast']?['daily']?['pm25'] as List<dynamic>?) ?? [];

  //   final List<AirQualityDay> days = pm25Forecast.map((day) {
  //     int raw = day["avg"] ?? 0;
  //     int aqi7 = scaleAQI(raw);
  //     return AirQualityDay(
  //       aqi: aqi7,
  //       date: DateTime.tryParse(day["day"] ?? "") ?? DateTime.now(),
  //     );
  //   }).toList();

  //   double getValue(Map<String, dynamic>? map) {
  //     if (map == null || map['v'] == null) return 0.0;
  //     final value = map['v'];
  //     if (value is int) return value.toDouble();
  //     if (value is double) return value;
  //     return 0.0;
  //   }

  //   return AirQualityModel(
  //     co: getValue(data['iaqi']?['co']),
  //     no2: getValue(data['iaqi']?['no2']),
  //     o3: getValue(data['iaqi']?['o3']),
  //     so2: getValue(data['iaqi']?['so2']),
  //     pm2_5: getValue(data['iaqi']?['pm25']),
  //     pm10: getValue(data['iaqi']?['pm10']),
  //     index: scaleAQI(data['aqi'] ?? 0),
  //     aqiDays: days,
  //   );
  // }
}


Map<String, dynamic> transformApiJson(Map<String, dynamic> json) {
    final data = json['data'] ?? {};

    int scaleAQI(int rawAqi) {
      double scaled = (rawAqi / 500) * 6 + 1;
      return scaled.round().clamp(1, 7);
    }

    double getValue(Map<String, dynamic>? map) {
      if (map == null || map['v'] == null) return 0.0;
      final value = map['v'];
      if (value is num) return value.toDouble();
      return 0.0;
    }

    final List<dynamic> pm25Forecast =
        (data['forecast']?['daily']?['pm25'] as List<dynamic>?) ?? [];

    final List<Map<String, dynamic>> aqiDays = pm25Forecast.map((day) {
      final raw = day["avg"] ?? 0;
      return {
        "aqi": scaleAQI(raw),
        "date": day["day"], 
      };
    }).toList();

    return {
      "co": getValue(data['iaqi']?['co']),
      "no2": getValue(data['iaqi']?['no2']),
      "o3": getValue(data['iaqi']?['o3']),
      "so2": getValue(data['iaqi']?['so2']),
      "pm2_5": getValue(data['iaqi']?['pm25']),
      "pm10": getValue(data['iaqi']?['pm10']),
      "index": scaleAQI(data['aqi'] ?? 0),
      "aqiDays": aqiDays,
    };
  }