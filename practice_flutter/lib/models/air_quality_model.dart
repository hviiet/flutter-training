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

  
  static double? _toDouble(dynamic v) {
    if (v == null) return null;
    if (v is num) return v.toDouble();
    if (v is String) return double.tryParse(v);
    return null;
  }

  factory AirQualityModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'] ?? json;
    final iaqi = data['iaqi'] ?? {};

    //  Parse 
    final forecastDaily = data['forecast']?['daily']?['pm25'] as List<dynamic>?;

    final List<AqiForecast> forecastList = forecastDaily != null
        ? forecastDaily.map((e) => AqiForecast.fromJson(e)).toList()
        : [];

    return AirQualityModel(
      aqi: data['aqi'] is int ? data['aqi'] : int.tryParse('${data['aqi']}'),
      o3: _toDouble(iaqi['o3']?['v']),
      pm10: _toDouble(iaqi['pm10']?['v']),
      no2: _toDouble(iaqi['no2']?['v']),
      no: _toDouble(iaqi['no']?['v']),
      so2: _toDouble(iaqi['so2']?['v']),
      co: _toDouble(iaqi['co']?['v']),
      pm25: _toDouble(iaqi['pm25']?['v']),
      forecast: forecastList,
    );
  }
}


class AqiForecast {
  final String day;
  final double avg;

  AqiForecast({required this.day, required this.avg});

  factory AqiForecast.fromJson(Map<String, dynamic> json) {
    return AqiForecast(
      day: json['day'] ?? '',
      avg: (json['avg'] ?? 0).toDouble(),
    );
  }
}
