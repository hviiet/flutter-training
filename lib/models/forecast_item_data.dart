import 'package:flutter_application_1/models/forecast_day.dart';

class ForecastItemData {
  final String day;
  final ForecastDay forecast;
  final int aqi;

  ForecastItemData({
    required this.day,
    required this.forecast,
    required this.aqi,
  });
}
