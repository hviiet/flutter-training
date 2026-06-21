class WeatherLocation {
  final String name;
  final String city;
  final int aqi;
  final double temp;
  final double feelsLike;
  final String conditionIcon;
  final String conditionText;

  WeatherLocation({
    required this.name,
    required this.city,
    required this.aqi,
    required this.temp,
    required this.feelsLike,
    required this.conditionIcon,
    required this.conditionText,
  });

  factory WeatherLocation.fromMergedJson(Map<String, dynamic> weatherJson, Map<String, dynamic> aqiJson) {
    final current = weatherJson['current'] ?? {};
    final condition = current['condition'] ?? {};
    final location = weatherJson['location'] ?? {};
    final aqidata = aqiJson['data'] ?? {};

    return WeatherLocation(
      name: location['name'] ?? '',
      city: location['region'] ?? '',
      aqi: aqidata['aqi'] ?? 0,
      temp: (current['temp_c'] as num?)?.toDouble() ?? 0.0,
      feelsLike: (current['feelslike_c'] as num?)?.toDouble() ?? 0.0,
      conditionIcon: 'https:${condition['icon']}',
      conditionText: condition['text'] ?? '',
    );
  }
}