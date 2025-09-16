import 'package:flutter/material.dart';

class Location {
  final String title;
  final String address;
  final int aqi;
  final IconData aqiIcon;
  final int temp;
  final IconData? weatherIcon;
  final IconData? trailingIcon;

  Location({
    required this.title,
    required this.address,
    required this.aqi,
    required this.aqiIcon,
    required this.temp,
    this.weatherIcon,
    this.trailingIcon,
  });
}
