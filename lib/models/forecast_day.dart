class ForecastDay {
  String date;
  String icon;
  double maxTemp;
  double minTemp;
  double avgTemp;

  ForecastDay({
    required this.date,
    required this.icon,
    required this.maxTemp,
    required this.minTemp,
    required this.avgTemp,
  });

  factory ForecastDay.fromJson(Map<String, dynamic> json) {
    return ForecastDay(
      date: json['date']??"",
      icon: json['day']['condition']['icon']??"",
      maxTemp: json['day']['maxtemp_c']??0,
      minTemp: json['day']['mintemp_c']??0,
      avgTemp: json['day']['avgtemp_c']??0,
    );
  }
}