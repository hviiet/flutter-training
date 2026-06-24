
import 'package:freezed_annotation/freezed_annotation.dart';

part 'air_quality_model.freezed.dart';

@freezed
abstract class AirQualityModel with _$AirQualityModel {
  const factory AirQualityModel({
    required double aqi,
    required double o3,
    required double pm10,
    required double co,
    required double no2,
    required double so2,
    required double pm25,
    required List<AqiForecastModel> forecast,
  }) = _AirQualityModel;

  factory AirQualityModel.fromJson(Map<String, dynamic> json) {
    return AirQualityModel(
      aqi: (json['data']['aqi'] as num).toDouble(),
      o3: (json['data']['iaqi']['o3']?['v'] as num?)?.toDouble() ?? 0.0,
      pm10: (json['data']['iaqi']['pm10']?['v'] as num?)?.toDouble() ?? 0.0,
      co: (json['data']['iaqi']['co']?['v'] as num?)?.toDouble() ?? 0.0,
      no2: (json['data']['iaqi']['no2']?['v'] as num?)?.toDouble() ?? 0.0,
      so2: (json['data']['iaqi']['so2']?['v'] as num?)?.toDouble() ?? 0.0,
      pm25: (json['data']['iaqi']['pm25']?['v'] as num?)?.toDouble() ?? 0.0,
      forecast: (json['data']['forecast']['daily']['pm25'] as List)
          .map((item) => AqiForecastModel.fromJson(item))
          .toList(),
    );
  }


}


@freezed
abstract class AqiForecastModel with _$AqiForecastModel {
  const factory AqiForecastModel({
    required DateTime day,
    required double avg,
  }) = _AqiForecastModel;

  factory AqiForecastModel.fromJson(Map<String, dynamic> json) {
    return AqiForecastModel(
      day: DateTime.parse(json['day']),
      avg: (json['avg'] as num).toDouble(),
    );
  }
}