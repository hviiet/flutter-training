import 'package:flutter/material.dart';

class PlaceInfo {
  final String title;
  final String address;
  final int aqi;
  final IconData aqiIcon;
  final IconData weatherIcon;
  final int temp;

  PlaceInfo({
    required this.title,
    required this.address,
    required this.aqi,
    required this.aqiIcon,
    required this.weatherIcon,
    required this.temp,
  });
}
