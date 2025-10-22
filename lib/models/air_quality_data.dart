import 'package:equatable/equatable.dart';

class AirQualityData extends Equatable {
  final String city;
  final int aqi;
  final String dominantPollutant;
  final DateTime time;
  final Map<String, Pollutant> pollutants;

  const AirQualityData({
    required this.city,
    required this.aqi,
    required this.dominantPollutant,
    required this.time,
    required this.pollutants,
  });

  factory AirQualityData.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    final iaqi = data['iaqi'] as Map<String, dynamic>;
    
    Map<String, Pollutant> pollutants = {};
    iaqi.forEach((key, value) {
      if (value is Map<String, dynamic> && value.containsKey('v')) {
        pollutants[key] = Pollutant(
          name: key,
          value: (value['v'] as num).toDouble(),
        );
      }
    });

    return AirQualityData(
      city: data['city']['name'] ?? '',
      aqi: data['aqi'] ?? 0,
      dominantPollutant: data['dominentpol'] ?? '',
      time: DateTime.parse(data['time']['iso']),
      pollutants: pollutants,
    );
  }

  String getAqiLevel() {
    if (aqi <= 50) return 'Low';
    if (aqi <= 100) return 'Moderate';
    if (aqi <= 150) return 'High';
    return 'Very High';
  }

  @override
  List<Object?> get props => [city, aqi, dominantPollutant, time, pollutants];
}

class Pollutant extends Equatable {
  final String name;
  final double value;

  const Pollutant({
    required this.name,
    required this.value,
  });

  String get displayName {
    switch (name.toLowerCase()) {
      case 'pm25':
        return 'PM2.5';
      case 'pm10':
        return 'PM10';
      case 'o3':
        return 'O₃ (ug/m3)';
      case 'no2':
        return 'NO₂ (ug/m3)';
      case 'co':
        return 'CO (ug/m3)';
      case 'so2':
        return 'SO₂ (ug/m3)';
      default:
        return name.toUpperCase();
    }
  }

  @override
  List<Object?> get props => [name, value];
}
