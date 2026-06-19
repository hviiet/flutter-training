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
      return Icon(Icons.mood, color: Colors.yellow); // Moderate
    } else if (aqiValue <= 150) {
      return Icon(Icons.mood_bad, color: Colors.orange, size: 24,); // Unhealthy for Sensitive Groups
    } else if (aqiValue <= 200) {
      return Icon(Icons.mood_bad, color: Colors.red, size: 24,); // Unhealthy
    } else if (aqiValue <= 300) {
      return Icon(Icons.sentiment_very_dissatisfied, color: Colors.purple, size: 24,); // Very Unhealthy
    } else {
      return Icon(Icons.sentiment_very_dissatisfied, color: Colors.brown, size: 24,); // Hazardous
    }
  }

  Color mapAQIToColor(String aqi) {
    int aqiValue = int.tryParse(aqi) ?? 0;
    if (aqiValue <= 50) {
      return Colors.green; // Good
    } else if (aqiValue <= 100) {
      return Colors.yellow; // Moderate
    } else if (aqiValue <= 150) {
      return Colors.orange; // Unhealthy for Sensitive Groups
    } else if (aqiValue <= 200) {
      return Colors.red; // Unhealthy
    } else if (aqiValue <= 300) {
      return Colors.purple; // Very Unhealthy
    } else {
      return Colors.brown; // Hazardous
    }
  }


  String mapDayInWeek(int index) {
    switch (index) {
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
      case 7:
        return "SUN";
      default:
        return "";
    }
    
  }

  String getMonthInWord(int index) {
    switch (index) {
      case 1:
        return "JAN";
      case 2:
        return "FEB";
      case 3:
        return "MAR";
      case 4:
        return "APR";
      case 5:
        return "MAY";
      case 6:
        return "JUN";
      case 7:
        return "JUL";
      case 8:
        return "AUG";
      case 9:
        return "SEP";
      case 10:
        return "OCT";
      case 11:
        return "NOV";
      case 12:
        return "DEC";
      default:
        return "";
    }
    
  }

  String mapCurrentDay(DateTime date){
    DateTime now = DateTime.now();
    if(date.day == now.day && date.month == now.month && date.year == now.year){
      return "Today";
    }
    else if(date.day == now.add(Duration(days: 1)).day && date.month == now.add(Duration(days: 1)).month && date.year == now.add(Duration(days: 1)).year){
      return "Tomorrow";
    }
    else{
      return formatDate(date);
    }
  }

  String formatDate(DateTime date){
    return "${date.day}/${date.month}/${date.year}";
  }

  //THU 11 NOV 21
  String formatFullDate(DateTime date){
    return "${getDayInWeek(date.weekday)} ${date.day} ${getMonthInWord(date.month)} ${date.year}";
  }
}