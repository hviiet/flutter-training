class WeatherHourModel {
  final String time; // "2025-10-24 09:00"
  final double tempC;
  final String iconUrl;

  WeatherHourModel({
    required this.time,
    required this.tempC,
    required this.iconUrl,
  });

  factory WeatherHourModel.fromJson(Map<String, dynamic> json) {
    return WeatherHourModel(
      time: json['time'] ?? '',
      tempC: (json['temp_c'] ?? 0).toDouble(),
      iconUrl: "https:${json['condition']['icon']}",
    );
  }
}
