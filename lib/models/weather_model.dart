// lib/models/weather_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_model.freezed.dart';
part 'weather_model.g.dart';

@freezed
class WeatherResponse with _$WeatherResponse {
  const factory WeatherResponse({
    required Location location,
    required Current current,
    required Forecast forecast,
  }) = _WeatherResponse;

  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseFromJson(json);
}

@freezed
class Location with _$Location {
  const factory Location({
    required String name,
    required String region,
    required double lat,
    required double lon,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}

@freezed
class Current with _$Current {
  const factory Current({
    @JsonKey(name: 'temp_c') required double tempC,
    @JsonKey(name: 'feelslike_c') required double feelsLikeC,
    @JsonKey(name: 'is_day') required int isDay,
    required Condition condition,

    /// WeatherAPI trả air_quality chỉ khi aqi=yes
    @JsonKey(name: 'air_quality') AirQuality? airQuality,
    @JsonKey(name: 'wind_kph') double? windKph,
    int? humidity,
  }) = _Current;

  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);
}

@freezed
class Forecast with _$Forecast {
  const factory Forecast({required List<ForecastDay> forecastday}) = _Forecast;

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);
}

@freezed
class ForecastDay with _$ForecastDay {
  const factory ForecastDay({
    /// "YYYY-MM-DD"
    required String date,
    required Day day,
    required List<Hour> hour,
  }) = _ForecastDay;

  factory ForecastDay.fromJson(Map<String, dynamic> json) =>
      _$ForecastDayFromJson(json);
}

@freezed
class Day with _$Day {
  const factory Day({
    @JsonKey(name: 'avgtemp_c') double? avgTempC,
    @JsonKey(name: 'maxtemp_c') double? maxTempC,
    @JsonKey(name: 'mintemp_c') double? minTempC,
    required Condition condition,

    /// đôi khi WeatherAPI cũng cung cấp air_quality ở cấp day
    @JsonKey(name: 'air_quality') AirQuality? airQuality,

    /// bạn có dùng daily_chance_of_rain trong recs
    @JsonKey(name: 'daily_chance_of_rain') int? dailyChanceOfRain,
  }) = _Day;

  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);
}

@freezed
class Hour with _$Hour {
  const factory Hour({
    required String time,
    @JsonKey(name: 'temp_c') required double tempC,
    @JsonKey(name: 'is_day') required int isDay,
    required Condition condition,
  }) = _Hour;

  factory Hour.fromJson(Map<String, dynamic> json) => _$HourFromJson(json);
}

@freezed
class Condition with _$Condition {
  const factory Condition({required String text}) = _Condition;

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);
}

@freezed
class AirQuality with _$AirQuality {
  const factory AirQuality({
    double? co,
    double? no2,
    double? o3,
    double? so2,
    @JsonKey(name: 'pm2_5') double? pm25,
    @JsonKey(name: 'pm10') double? pm10,

    /// chỉ số tổng hợp
    @JsonKey(name: 'us-epa-index') int? usEpaIndex,
    @JsonKey(name: 'gb-defra-index') int? gbDefraIndex,
  }) = _AirQuality;

  factory AirQuality.fromJson(Map<String, dynamic> json) =>
      _$AirQualityFromJson(json);
}
