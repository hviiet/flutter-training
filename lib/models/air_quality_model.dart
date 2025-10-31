class AirQualityData {
  final int aqi;
  final String cityName;
  final double o3;
  final double pm10;
  final double no;
  final double no2;
  final double pm1;
  final double pm25;

  AirQualityData({
    required this.aqi,
    required this.cityName,
    required this.o3,
    required this.pm10,
    required this.no,
    required this.no2,
    required this.pm1,
    required this.pm25,
  });

  factory AirQualityData.fromJson(Map<String, dynamic> json) {
    double getValue(dynamic data) {
      if (data == null) return 0.0;
      if (data is Map && data.containsKey('v')) {
        return (data['v'] ?? 0.0).toDouble();
      }
      if (data is num) return data.toDouble();
      return 0.0;
    }

    final iaqi = json['data']?['iaqi'] ?? {};
    final airData = AirQualityData(
      aqi: json['data']?['aqi'] ?? 0,
      cityName: json['data']?['city']?['name'] ?? 'Unknown City',
      o3: getValue(iaqi['o3']),
      pm10: getValue(iaqi['pm10']),
      no: getValue(iaqi['no']),
      no2: getValue(iaqi['no2']),
      pm1: getValue(iaqi['pm1']),
      pm25: getValue(iaqi['pm25']),
    );
    return airData;
  }
}
