import 'package:json_annotation/json_annotation.dart';

part 'air_quality_model.g.dart';

@JsonSerializable(explicitToJson: true)
class AirQualityModel {
  final int? aqi;
  final double? o3;
  final double? pm10;
  final double? no2;
  final double? no;
  final double? so2;
  final double? co;
  final double? pm25;
  final List<AqiForecast>? forecast;

  AirQualityModel({
    this.aqi,
    this.o3,
    this.pm10,
    this.no2,
    this.no,
    this.so2,
    this.co,
    this.pm25,
    this.forecast,
  });

  /// ✅ Factory tự động convert JSON từ WAQI (custom flatten trước khi build)
  factory AirQualityModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'] ?? json;
    final iaqi = data['iaqi'] ?? {};

    // Parse forecast: chỉ lấy pm25 vì bạn đang hiển thị nó
    final forecastDaily = data['forecast']?['daily']?['pm25'] as List<dynamic>?;

    return AirQualityModel(
      aqi: data['aqi'] is int ? data['aqi'] : int.tryParse('${data['aqi']}'),
      o3: _toDouble(iaqi['o3']?['v']),
      pm10: _toDouble(iaqi['pm10']?['v']),
      no2: _toDouble(iaqi['no2']?['v']),
      no: _toDouble(iaqi['no']?['v']),
      so2: _toDouble(iaqi['so2']?['v']),
      co: _toDouble(iaqi['co']?['v']),
      pm25: _toDouble(iaqi['pm25']?['v']),
      forecast: forecastDaily
          ?.map((e) => AqiForecast.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  /// ✅ toJson để build_runner vẫn hoạt động
  Map<String, dynamic> toJson() => _$AirQualityModelToJson(this);

  /// Helper để ép kiểu
  static double? _toDouble(dynamic v) {
    if (v == null) return null;
    if (v is num) return v.toDouble();
    if (v is String) return double.tryParse(v);
    return null;
  }
}

@JsonSerializable()
class AqiForecast {
  final String day;
  final double avg;
  final double? max;
  final double? min;

  AqiForecast({required this.day, required this.avg, this.max, this.min});

  factory AqiForecast.fromJson(Map<String, dynamic> json) =>
      _$AqiForecastFromJson(json);

  Map<String, dynamic> toJson() => _$AqiForecastToJson(this);
}
