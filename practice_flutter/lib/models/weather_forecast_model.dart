class ForecastDayModel {
  final DateTime date;
  final double maxTempC;
  final double minTempC;
  final String conditionText;
  final String iconUrl;

  ForecastDayModel({
    required this.date,
    required this.maxTempC,
    required this.minTempC,
    required this.conditionText,
    required this.iconUrl,
  });

  factory ForecastDayModel.fromJson(Map<String, dynamic> json) {
    return ForecastDayModel(
      date: DateTime.parse(json['date']),
      maxTempC: (json['day']['maxtemp_c'] ?? 0).toDouble(),
      minTempC: (json['day']['mintemp_c'] ?? 0).toDouble(),
      conditionText: json['day']['condition']['text'] ?? '',
      iconUrl: "https:${json['day']['condition']['icon']}",
    );
  }
}
