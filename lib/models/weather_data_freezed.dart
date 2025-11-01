// Example: WeatherData model using Freezed + json_serializable
// This is a DEMO file to show how to use code generation
// 
// To generate code, run:
// flutter pub run build_runner build --delete-conflicting-outputs
//
// Benefits:
// ✅ Auto-generate copyWith, ==, hashCode, toString
// ✅ Auto-generate fromJson/toJson
// ✅ Immutable by default
// ✅ Less boilerplate code
// ✅ Type-safe

import 'package:freezed_annotation/freezed_annotation.dart';

// Required: add these lines for code generation
part 'weather_data_freezed.freezed.dart';
part 'weather_data_freezed.g.dart';

@freezed
class WeatherDataFreezed with _$WeatherDataFreezed {
  const factory WeatherDataFreezed({
    required String location,
    required String region,
    required CurrentWeather current,
    required List<ForecastDayFreezed> forecast,
  }) = _WeatherDataFreezed;

  factory WeatherDataFreezed.fromJson(Map<String, dynamic> json) => 
      _$WeatherDataFreezedFromJson(json);
}

@freezed
class CurrentWeather with _$CurrentWeather {
  const factory CurrentWeather({
    @JsonKey(name: 'temp_c') required double tempC,
    @JsonKey(name: 'temp_f') required double tempF,
    @JsonKey(name: 'condition') required WeatherCondition condition,
    @JsonKey(name: 'feelslike_c') required double feelsLikeC,
    @JsonKey(name: 'air_quality') AirQualityFreezed? airQuality,
  }) = _CurrentWeather;

  factory CurrentWeather.fromJson(Map<String, dynamic> json) => 
      _$CurrentWeatherFromJson(json);
}

@freezed
class WeatherCondition with _$WeatherCondition {
  const factory WeatherCondition({
    required String text,
    required String icon,
  }) = _WeatherCondition;

  factory WeatherCondition.fromJson(Map<String, dynamic> json) => 
      _$WeatherConditionFromJson(json);
}

@freezed
class AirQualityFreezed with _$AirQualityFreezed {
  const AirQualityFreezed._(); // Enable custom methods

  const factory AirQualityFreezed({
    double? co,
    double? no2,
    double? o3,
    double? so2,
    @JsonKey(name: 'pm2_5') double? pm25,
    double? pm10,
    @JsonKey(name: 'us-epa-index') int? usEpaIndex,
    @JsonKey(name: 'gb-defra-index') int? gbDefraIndex,
  }) = _AirQualityFreezed;

  factory AirQualityFreezed.fromJson(Map<String, dynamic> json) => 
      _$AirQualityFreezedFromJson(json);

  // Custom getter: Convert US EPA Index to AQI value on scale 1-10
  int get aqi {
    // Prefer UK Defra Index if available (already 1-10)
    if (gbDefraIndex != null && gbDefraIndex! >= 1 && gbDefraIndex! <= 10) {
      return gbDefraIndex!;
    }
    
    // Otherwise convert US EPA Index (1-6) to 1-10 scale
    if (usEpaIndex != null) {
      switch (usEpaIndex!) {
        case 1: return 1;   // Good -> Low (1-3)
        case 2: return 4;   // Moderate -> Moderate (4-6)
        case 3: return 6;   // Unhealthy for sensitive -> Moderate (4-6)
        case 4: return 7;   // Unhealthy -> High (7-8)
        case 5: return 9;   // Very Unhealthy -> Very High (9-10)
        case 6: return 10;  // Hazardous -> Very High (9-10)
        default: return 4;
      }
    }
    return 4; // Default moderate value
  }

  String get aqiLevel {
    final aqiValue = aqi;
    if (aqiValue <= 3) return 'Low';
    if (aqiValue <= 6) return 'Moderate';
    if (aqiValue <= 8) return 'High';
    return 'Very High';
  }
}

@freezed
class ForecastDayFreezed with _$ForecastDayFreezed {
  const ForecastDayFreezed._(); // Enable custom methods

  const factory ForecastDayFreezed({
    required DateTime date,
    @JsonKey(name: 'day') required DayForecast dayForecast,
    required List<HourlyForecastFreezed> hour,
  }) = _ForecastDayFreezed;

  factory ForecastDayFreezed.fromJson(Map<String, dynamic> json) => 
      _$ForecastDayFreezedFromJson(json);

  // Custom getter
  String get dayName {
    final weekdays = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];
    return weekdays[date.weekday - 1];
  }
}

@freezed
class DayForecast with _$DayForecast {
  const factory DayForecast({
    @JsonKey(name: 'maxtemp_c') required double maxTempC,
    @JsonKey(name: 'mintemp_c') required double minTempC,
    required WeatherCondition condition,
    @JsonKey(name: 'air_quality') AirQualityFreezed? airQuality,
  }) = _DayForecast;

  factory DayForecast.fromJson(Map<String, dynamic> json) => 
      _$DayForecastFromJson(json);
}

@freezed
class HourlyForecastFreezed with _$HourlyForecastFreezed {
  const factory HourlyForecastFreezed({
    required DateTime time,
    @JsonKey(name: 'temp_c') required double tempC,
    required WeatherCondition condition,
    @JsonKey(name: 'air_quality') AirQualityFreezed? airQuality,
  }) = _HourlyForecastFreezed;

  factory HourlyForecastFreezed.fromJson(Map<String, dynamic> json) => 
      _$HourlyForecastFreezedFromJson(json);
}

// ==========================================
// HOW TO USE:
// ==========================================
//
// 1. Add dependencies to pubspec.yaml:
//    dependencies:
//      freezed_annotation: ^2.4.1
//      json_annotation: ^4.8.1
//    
//    dev_dependencies:
//      build_runner: ^2.4.8
//      freezed: ^2.4.7
//      json_serializable: ^6.7.1
//
// 2. Run code generation:
//    flutter pub run build_runner build --delete-conflicting-outputs
//
// 3. Use in code:
//    final weather = WeatherDataFreezed.fromJson(jsonData);
//    
//    // Auto-generated copyWith
//    final updated = weather.copyWith(location: 'New York');
//    
//    // Auto-generated equality
//    if (weather == updated) { ... }
//    
//    // Auto-generated toString
//    print(weather.toString());
//
// 4. Watch mode (auto-regenerate on file changes):
//    flutter pub run build_runner watch
