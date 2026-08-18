class AirQuality {
  final int aqi;
  final double co;
  final double no2;
  final double o3;
  final double so2;
  final double pm10;
  final double pm25;
  final List<int> forecast;

  const AirQuality({
    required this.aqi,
    required this.co,
    required this.no2,
    required this.o3,
    required this.so2,
    required this.pm10,
    required this.pm25,
    required this.forecast,
  });

  factory AirQuality.fromAqicn(Map<String, dynamic> json) {
    final data = Map<String, dynamic>.from(json['data']);
    final iaqi = Map<String, dynamic>.from(data['iaqi'] ?? {});

    double valueOf(String key) {
      return ((iaqi[key] as Map?)?['v'] as num?)?.toDouble() ?? 0;
    }

    final daily = Map<String, dynamic>.from(
      (data['forecast'] as Map?)?['daily'] ?? {},
    );

    final pm25Forecast = (daily['pm25'] as List? ?? []);

    return AirQuality(
      aqi: (data['aqi'] as num?)?.toInt() ?? 0,
      co: valueOf('co'),
      no2: valueOf('no2'),
      o3: valueOf('o3'),
      so2: valueOf('so2'),
      pm10: valueOf('pm10'),
      pm25: valueOf('pm25'),
      forecast: pm25Forecast
          .map((item) => ((item as Map)['avg'] as num).round())
          .toList(),
    );
  }
}