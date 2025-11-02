import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'aqi_scale_info.freezed.dart';

@freezed
class AQIScaleInfo with _$AQIScaleInfo {
  const AQIScaleInfo._();
  
  const factory AQIScaleInfo({
    required String level,
    required String range,
    required String description,
    required Color color,
    required IconData icon,
  }) = _AQIScaleInfo;

  static List<AQIScaleInfo> get allLevels => [
    const AQIScaleInfo(
      level: 'Low',
      range: 'Air Quality Index: 1 to 3',
      description: 'Air quality can change quickly due to weather and human activity. Air quality forecasts are often published based on whether current conditions are more or less favorable to pollution from human activity can dramatically...',
      color: Color.fromARGB(255, 112, 232, 116),
      icon: Icons.sentiment_satisfied,
    ),
    const AQIScaleInfo(
      level: 'Moderate',
      range: 'Air Quality Index: 4 to 6',
      description: 'Air quality can change quickly due to weather and human activity. Air quality forecasts are often published based on whether current conditions are more or less favorable to pollution from human activity can dramatically...',
      color: Color(0xFFFFA726),
      icon: Icons.sentiment_neutral,
    ),
    const AQIScaleInfo(
      level: 'High',
      range: 'Air Quality Index: 7 to 8',
      description: 'Air quality can change quickly due to weather and human activity. Air quality forecasts are often published based on whether current conditions are more or less favorable to pollution from human activity can dramatically...',
      color: Color(0xFFFF5252),
      icon: Icons.sentiment_dissatisfied,
    ),
    const AQIScaleInfo(
      level: 'Very High',
      range: 'Air Quality Index: 9 to 10',
      description: 'Air quality can change quickly due to weather and human activity. Air quality forecasts are often published based on whether current conditions are more or less favorable to pollution from human activity can dramatically...',
      color: Color(0xFF9C27B0),
      icon: Icons.sentiment_very_dissatisfied,
    ),
  ];

  static AQIScaleInfo fromAQI(int aqi) {
    // AQI scale 1-10
    if (aqi <= 3) return allLevels[0];  // Low: 1-3
    if (aqi <= 6) return allLevels[1];  // Moderate: 4-6
    if (aqi <= 8) return allLevels[2];  // High: 7-8
    return allLevels[3];                 // Very High: 9-10
  }
}
