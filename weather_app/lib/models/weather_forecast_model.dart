class WeatherForecastModel {
  final DateTime date;
  final double avgtemp_c;
  final double maxtemp_c;
  final double mintemp_c;
  final String conditionText;
  final String conditionIcon;

  WeatherForecastModel({
    required this.date,
    required this.avgtemp_c,
    required this.maxtemp_c,
    required this.mintemp_c,
    required this.conditionText,
    required this.conditionIcon,
  });

  factory WeatherForecastModel.fromJson(Map<String, dynamic> json) {
    return WeatherForecastModel(
      date: DateTime.parse(json['date']),
      avgtemp_c: json['day']['avgtemp_c'].toDouble(),
      maxtemp_c: json['day']['maxtemp_c'].toDouble(),
      mintemp_c: json['day']['mintemp_c'].toDouble(),
      conditionText: json['day']['condition']['text']??'',
      conditionIcon: 'https:${json['day']['condition']['icon']}' ?? '',
    );
  }

}