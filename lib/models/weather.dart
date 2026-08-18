class WeatherHour {
  final String time;
  final double temperature;
  final String condition;
  final String iconUrl;

  const WeatherHour({
    required this.time,
    required this.temperature,
    required this.condition,
    required this.iconUrl,
  });

  factory WeatherHour.fromJson(Map<String, dynamic> json) {
    final condition = Map<String, dynamic>.from(json['condition'] ?? {});
    return WeatherHour(
      time: json['time']?.toString() ?? '',
      temperature: (json['temp_c'] as num?)?.toDouble() ?? 0,
      condition: condition['text']?.toString() ?? '',
      iconUrl: _normalizeIcon(condition['icon']?.toString() ?? ''),
    );
  }
}

class WeatherDay {
  final String date;
  final double maxTemp;
  final double minTemp;
  final String condition;
  final String iconUrl;

  const WeatherDay({
    required this.date,
    required this.maxTemp,
    required this.minTemp,
    required this.condition,
    required this.iconUrl,
  });

  factory WeatherDay.fromJson(Map<String, dynamic> json) {
    final day = Map<String, dynamic>.from(json['day']);
    final condition = Map<String, dynamic>.from(day['condition']);

    return WeatherDay(
      date: json['date'] ?? '',
      maxTemp: (day['maxtemp_c'] as num?)?.toDouble() ?? 0,
      minTemp: (day['mintemp_c'] as num?)?.toDouble() ?? 0,
      condition: condition['text'] ?? '',
      iconUrl: _normalizeIcon(condition['icon'] ?? ''),
    );
  }
}

class Weather {
  final String locationName;
  final String region;
  final double temperature;
  final double feelsLike;
  final String condition;
  final String iconUrl;
  final List<WeatherDay> forecast;
  final List<WeatherHour> hourlyForecast;

  const Weather({
    required this.locationName,
    required this.region,
    required this.temperature,
    required this.feelsLike,
    required this.condition,
    required this.iconUrl,
    required this.forecast,
    required this.hourlyForecast,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    final location = Map<String, dynamic>.from(json['location']);
    final current = Map<String, dynamic>.from(json['current']);
    final condition = Map<String, dynamic>.from(current['condition']);
    final forecast = Map<String, dynamic>.from(json['forecast']);
    final forecastDays = (forecast['forecastday'] as List? ?? []);
    final firstDay = forecastDays.isEmpty
        ? <String, dynamic>{}
        : Map<String, dynamic>.from(forecastDays.first);

    return Weather(
      locationName: location['name'] ?? '',
      region: location['region'] ?? location['country'] ?? '',
      temperature: (current['temp_c'] as num?)?.toDouble() ?? 0,
      feelsLike: (current['feelslike_c'] as num?)?.toDouble() ?? 0,
      condition: condition['text'] ?? '',
      iconUrl: _normalizeIcon(condition['icon'] ?? ''),
      forecast: forecastDays
          .map((item) => WeatherDay.fromJson(
                Map<String, dynamic>.from(item),
              ))
          .toList(),
      hourlyForecast: (firstDay['hour'] as List? ?? [])
          .map(
            (item) => WeatherHour.fromJson(
              Map<String, dynamic>.from(item),
            ),
          )
          .toList(),
    );
  }
}

String _normalizeIcon(String url) {
  return url.startsWith('//') ? 'https:$url' : url;
}

//dùng để chuẩn hóa URL của icon thời tiết,bảo đảm URL có thể tải và hiển thị 
