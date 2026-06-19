class AirQualityModel {
  final double aqi;
  final double o3;
  final double pm10;
  final double co;
  final double no2;
  final double so2;
  final double pm25;
  final List<AqiForecastModel> forecast;

  AirQualityModel({
    required this.aqi,
    required this.o3,
    required this.pm10,
    required this.co,
    required this.no2,
    required this.so2,
    required this.pm25,
    required this.forecast,
  });

  factory AirQualityModel.fromJson(Map<String, dynamic> json) {
    return AirQualityModel(
      aqi: json['data']['aqi'].toDouble(),
      o3: json['data']['iaqi']['o3']?['v']?.toDouble() ?? 0.0,
      pm10: json['data']['iaqi']['pm10']?['v']?.toDouble() ?? 0.0,
      co: json['data']['iaqi']['co']?['v']?.toDouble() ?? 0.0,
      no2: json['data']['iaqi']['no2']?['v']?.toDouble() ?? 0.0,
      so2: json['data']['iaqi']['so2']?['v']?.toDouble() ?? 0.0,
      pm25: json['data']['iaqi']['pm25']?['v']?.toDouble() ?? 0.0,
      forecast: (json['data']['forecast']['daily']['pm25'] as List)
          .map((item) => AqiForecastModel.fromJson(item))
          .toList(),
    );
  }

}

class AqiForecastModel {
  final DateTime day;
  final int avg;

  AqiForecastModel({
    required this.day,
    required this.avg,
  });

  factory AqiForecastModel.fromJson(Map<String, dynamic> json) {
    return AqiForecastModel(
      day: DateTime.parse(json['day']),
      avg: json['avg'],
    );
  }
}