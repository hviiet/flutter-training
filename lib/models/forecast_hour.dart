class ForecastHour {
  String icon;
  double temp;
  DateTime time;

  ForecastHour({
    required this.icon,
    required this.temp,
    required this.time,
  });

  factory ForecastHour.fromJson(Map<String, dynamic> json) {
    return ForecastHour(
      icon: json['condition']['icon']??"",
      temp: json['temp_c']??0,
      time: DateTime.parse(json['time']??"1970-01-01 00:00"),
    );
  }
}