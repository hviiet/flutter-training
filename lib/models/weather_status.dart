import 'package:flutter/material.dart';

enum WeatherStatus {
  rainShower,
  cloudy,
  partlyCloudy,
  sunny,
  snow;
}

extension WeatherStatusExtension on WeatherStatus {
  String get getLabel => switch (this) {
    WeatherStatus.rainShower => 'Rain Shower',
    WeatherStatus.cloudy => 'Cloudy',
    WeatherStatus.partlyCloudy => 'Partly Cloudy',
    WeatherStatus.sunny => 'Sunny',
    WeatherStatus.snow => 'Snow',
  };

  IconData get getIcon => switch (this) {
    WeatherStatus.rainShower => Icons.grain_rounded,
    WeatherStatus.cloudy => Icons.cloud_queue_rounded,
    WeatherStatus.partlyCloudy => Icons.wb_cloudy_rounded,
    WeatherStatus.sunny => Icons.wb_sunny_rounded,
    WeatherStatus.snow => Icons.ac_unit_rounded,
  };

  Color get getColor => const Color.fromARGB(255, 37, 146, 255);
}
