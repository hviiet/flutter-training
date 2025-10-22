import 'package:equatable/equatable.dart';

class WeatherData extends Equatable {
  final String location;
  final String region;
  final Current current;
  final List<ForecastDay> forecast;

  const WeatherData({
    required this.location,
    required this.region,
    required this.current,
    required this.forecast,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      location: json['location']['name'] ?? '',
      region: json['location']['region'] ?? '',
      current: Current.fromJson(json['current']),
      forecast: (json['forecast']['forecastday'] as List)
          .map((day) => ForecastDay.fromJson(day))
          .toList(),
    );
  }

  @override
  List<Object?> get props => [location, region, current, forecast];
}

class Current extends Equatable {
  final double tempC;
  final double tempF;
  final String condition;
  final String conditionIcon;
  final double feelsLikeC;
  final AirQuality? airQuality; // Add air quality data

  const Current({
    required this.tempC,
    required this.tempF,
    required this.condition,
    required this.conditionIcon,
    required this.feelsLikeC,
    this.airQuality,
  });

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
      tempC: (json['temp_c'] as num).toDouble(),
      tempF: (json['temp_f'] as num).toDouble(),
      condition: json['condition']['text'] ?? '',
      conditionIcon: json['condition']['icon'] ?? '',
      feelsLikeC: (json['feelslike_c'] as num).toDouble(),
      airQuality: json['air_quality'] != null 
          ? AirQuality.fromJson(json['air_quality'])
          : null,
    );
  }

  @override
  List<Object?> get props => [tempC, tempF, condition, conditionIcon, feelsLikeC, airQuality];
}

// Add Air Quality class to parse from Weather API
class AirQuality extends Equatable {
  final double? co;        // Carbon Monoxide (μg/m3)
  final double? no2;       // Nitrogen dioxide (μg/m3)
  final double? o3;        // Ozone (μg/m3)
  final double? so2;       // Sulphur dioxide (μg/m3)
  final double? pm25;      // PM2.5 (μg/m3)
  final double? pm10;      // PM10 (μg/m3)
  final int? usEpaIndex;   // US EPA standard (1-6)
  final int? gbDefraIndex; // UK Defra Index

  const AirQuality({
    this.co,
    this.no2,
    this.o3,
    this.so2,
    this.pm25,
    this.pm10,
    this.usEpaIndex,
    this.gbDefraIndex,
  });

  factory AirQuality.fromJson(Map<String, dynamic> json) {
    return AirQuality(
      co: json['co'] != null ? (json['co'] as num).toDouble() : null,
      no2: json['no2'] != null ? (json['no2'] as num).toDouble() : null,
      o3: json['o3'] != null ? (json['o3'] as num).toDouble() : null,
      so2: json['so2'] != null ? (json['so2'] as num).toDouble() : null,
      pm25: json['pm2_5'] != null ? (json['pm2_5'] as num).toDouble() : null,
      pm10: json['pm10'] != null ? (json['pm10'] as num).toDouble() : null,
      usEpaIndex: json['us-epa-index'] as int?,
      gbDefraIndex: json['gb-defra-index'] as int?,
    );
  }

  // Convert US EPA Index to AQI value (approximation)
  int get aqi {
    if (usEpaIndex != null) {
      // US EPA Index: 1=Good, 2=Moderate, 3=Unhealthy for sensitive, 4=Unhealthy, 5=Very Unhealthy, 6=Hazardous
      switch (usEpaIndex!) {
        case 1: return 25;   // Good
        case 2: return 75;   // Moderate
        case 3: return 125;  // Unhealthy for sensitive
        case 4: return 175;  // Unhealthy
        case 5: return 225;  // Very Unhealthy
        case 6: return 325;  // Hazardous
        default: return 50;
      }
    }
    return 50; // Default moderate value
  }

  String getAqiLevel() {
    final aqiValue = aqi;
    if (aqiValue <= 50) return 'Low';
    if (aqiValue <= 100) return 'Moderate';
    if (aqiValue <= 150) return 'High';
    return 'Very High';
  }

  @override
  List<Object?> get props => [co, no2, o3, so2, pm25, pm10, usEpaIndex, gbDefraIndex];
}

class ForecastDay extends Equatable {
  final DateTime date;
  final double maxTempC;
  final double minTempC;
  final String condition;
  final String conditionIcon;
  final List<HourlyForecast> hourly;

  const ForecastDay({
    required this.date,
    required this.maxTempC,
    required this.minTempC,
    required this.condition,
    required this.conditionIcon,
    required this.hourly,
  });

  factory ForecastDay.fromJson(Map<String, dynamic> json) {
    return ForecastDay(
      date: DateTime.parse(json['date']),
      maxTempC: (json['day']['maxtemp_c'] as num).toDouble(),
      minTempC: (json['day']['mintemp_c'] as num).toDouble(),
      condition: json['day']['condition']['text'] ?? '',
      conditionIcon: json['day']['condition']['icon'] ?? '',
      hourly: (json['hour'] as List)
          .map((hour) => HourlyForecast.fromJson(hour))
          .toList(),
    );
  }

  String get dayName {
    final weekdays = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];
    return weekdays[date.weekday - 1];
  }

  @override
  List<Object?> get props => [date, maxTempC, minTempC, condition, conditionIcon, hourly];
}

class HourlyForecast extends Equatable {
  final DateTime time;
  final double tempC;
  final String condition;
  final String conditionIcon;

  const HourlyForecast({
    required this.time,
    required this.tempC,
    required this.condition,
    required this.conditionIcon,
  });

  factory HourlyForecast.fromJson(Map<String, dynamic> json) {
    return HourlyForecast(
      time: DateTime.parse(json['time']),
      tempC: (json['temp_c'] as num).toDouble(),
      condition: json['condition']['text'] ?? '',
      conditionIcon: json['condition']['icon'] ?? '',
    );
  }

  @override
  List<Object?> get props => [time, tempC, condition, conditionIcon];
}
