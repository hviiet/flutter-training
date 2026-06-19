class WeatherHourModel {
  final DateTime time;
  final double temp_c;
  final String conditionIcon;

  WeatherHourModel({
    required this.time,
    required this.temp_c,
    required this.conditionIcon,
  });

  factory WeatherHourModel.fromJson(Map<String, dynamic> json) {
    return WeatherHourModel(
      time: DateTime.parse(json['time']),
      temp_c: json['temp_c'].toDouble(),
      conditionIcon: 'https:${json['condition']['icon']}' ?? '',
    );
  }
}