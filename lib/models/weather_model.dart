class WeatherData {
  final double currentTemp;
  final String condition;
  final double feelsLike;
  final List<HourlyForecast> hourlyForecast;
  final List<DailyForecast> dailyForecast;

  WeatherData({
    required this.currentTemp,
    required this.condition,
    required this.feelsLike,
    required this.hourlyForecast,
    required this.dailyForecast,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    var hourlyList = (json['forecast']['forecastday'][0]['hour'] as List)
        .map((hourJson) => HourlyForecast.fromJson(hourJson))
        .toList();

    var dailyList = (json['forecast']['forecastday'] as List)
        .map((dayJson) => DailyForecast.fromJson(dayJson))
        .toList();

    return WeatherData(
      currentTemp: (json['current']['temp_c'] ?? 0.0).toDouble(),
      condition: json['current']['condition']['text'] ?? '',
      feelsLike: (json['current']['feelslike_c'] ?? 0.0).toDouble(),
      hourlyForecast: hourlyList,
      dailyForecast: dailyList,
    );
  }
}

class HourlyForecast {
  final String time;
  final double temp;
  final String condition;

  HourlyForecast({required this.time, required this.temp, required this.condition});

  factory HourlyForecast.fromJson(Map<String, dynamic> json) {
    String timeString = json['time'] ?? '00:00';
    String hour = timeString.split(' ')[1];

    return HourlyForecast(
      time: hour,
      temp: (json['temp_c'] ?? 0.0).toDouble(),
      condition: json['condition']['text'] ?? '',
    );
  }
}

class DailyForecast {
  final String date;
  final double maxTemp;
  final double minTemp;
  final String condition;

  DailyForecast({
    required this.date,
    required this.maxTemp,
    required this.minTemp,
    required this.condition,
  });

  factory DailyForecast.fromJson(Map<String, dynamic> json) {
    return DailyForecast(
      date: json['date'] ?? '',
      maxTemp: (json['day']['maxtemp_c'] ?? 0.0).toDouble(),
      minTemp: (json['day']['mintemp_c'] ?? 0.0).toDouble(),
      condition: json['day']['condition']['text'] ?? '',
    );
  }
}