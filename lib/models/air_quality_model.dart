// lib/models/air_quality_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'air_quality_model.freezed.dart';

@freezed
class AirQualityData with _$AirQualityData {
  const factory AirQualityData({
    required int aqi,
    required String cityName,
    required double o3,
    required double pm10,
    required double no,
    required double no2,
    required double pm1,
    required double pm25,
  }) = _AirQualityData;

  factory AirQualityData.fromJson(Map<String, dynamic> json) {
    double getValue(dynamic pollutantData) {
      if (pollutantData is Map && pollutantData.containsKey('v')) {
        final value = num.tryParse(pollutantData['v']?.toString() ?? '');
        return value?.toDouble() ?? 0.0;
      }
      return 0.0;
    }

    final dataMap = (json['data'] is Map<String, dynamic>)
        ? json['data'] as Map<String, dynamic>
        : null;

    final iaqi = (dataMap?['iaqi'] is Map<String, dynamic>)
        ? dataMap!['iaqi'] as Map<String, dynamic>
        : <String, dynamic>{};

    final cityMap = (dataMap?['city'] is Map<String, dynamic>)
        ? dataMap!['city'] as Map<String, dynamic>
        : null;

    return AirQualityData(
      aqi: (dataMap?['aqi'] as num?)?.toInt() ?? 0,
      cityName: cityMap?['name'] as String? ?? 'Unknown City',
      o3: getValue(iaqi['o3']),
      pm10: getValue(iaqi['pm10']),
      no: getValue(iaqi['no']),
      no2: getValue(iaqi['no2']),
      pm1: getValue(iaqi['pm1']),
      pm25: getValue(iaqi['pm25']),
    );
  }
}