import 'package:flutter/material.dart';

class Utils {
  static String getDayInWeek(int index) {
    switch (index) {
      case 0:
        return "SUN";
      case 1:
        return "MON";
      case 2:
        return "TUE";
      case 3:
        return "WED";
      case 4:
        return "THU";
      case 5:
        return "FRI";
      case 6:
        return "SAT";
      default:
        return "";
    }
  }

  Icon mapAQIToIcon(String aqi) {
    int aqiValue = int.tryParse(aqi) ?? 0;
    if (aqiValue <= 50) {
      return Icon(Icons.mood, color: Colors.green); // Good
    } else if (aqiValue <= 100) {
      return Icon(Icons.mood_bad, color: Colors.yellow); // Moderate
    } else if (aqiValue <= 150) {
      return Icon(Icons.sentiment_dissatisfied, color: Colors.orange); // Unhealthy for Sensitive Groups
    } else if (aqiValue <= 200) {
      return Icon(Icons.sentiment_very_dissatisfied, color: Colors.red); // Unhealthy
    } else if (aqiValue <= 300) {
      return Icon(Icons.dangerous, color: Colors.purple); // Very Unhealthy
    } else {
      return Icon(Icons.warning, color: Colors.brown); // Hazardous
    }
  }

  
}