import 'package:freezed_annotation/freezed_annotation.dart';

part 'air_quality.freezed.dart';
part 'air_quality.g.dart';

@freezed
abstract class AirQuality with _$AirQuality {
  const factory AirQuality({
    required int aqi,
    required double co,
    required double no2,
    required double o3,
    required double so2,
    required double pm10,
    required double pm25,
    required List<int> forecast,
  }) = _AirQuality;

  // factory tự động tạo ra từ json
  factory AirQuality.fromJson(Map<String, dynamic> json) =>
      _$AirQualityFromJson(_aqicnJson(json));
  
}

Map<String, dynamic> _aqicnJson(Map<String, dynamic> json) {
  if (json.containsKey('aqi') && !json.containsKey('data')) return json;
  final data = _asMap(json['data']);
  final iaqi = _asMap(data['iaqi']);
  final daily = _asMap(_asMap(data['forecast'])['daily']);
  double valueOf(String key) =>
      (_asMap(iaqi[key])['v'] as num?)?.toDouble() ?? 0;
  return {
    'aqi': (data['aqi'] as num?)?.toInt() ?? 0,
    'co': valueOf('co'),
    'no2': valueOf('no2'),
    'o3': valueOf('o3'),
    'so2': valueOf('so2'),
    'pm10': valueOf('pm10'),
    'pm25': valueOf('pm25'),
    'forecast': _asList(
      daily['pm25'],
    ).map((item) => ((_asMap(item)['avg'] as num?) ?? 0).round()).toList(),
  };
  
}


Map<String, dynamic> _asMap(Object? value) =>
    value is Map ? Map<String, dynamic>.from(value) : <String, dynamic>{};
List<dynamic> _asList(Object? value) => value is List ? value : const [];
