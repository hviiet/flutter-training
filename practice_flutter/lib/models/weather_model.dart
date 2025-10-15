class WeatherModel {
  final String location;
  final double tempC;
  final double feelslikeC; 
  final String conditionText;
  final String iconUrl;

  WeatherModel({
    required this.location,
    required this.tempC,
    required this.feelslikeC, 
    required this.conditionText,
    required this.iconUrl,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      location: json['location']['name'] ?? '',
      tempC: (json['current']['temp_c'] ?? 0).toDouble(),
      feelslikeC: (json['current']['feelslike_c'] ?? 0)
          .toDouble(), // Lấy dữ liệu từ API
      conditionText: json['current']['condition']['text'] ?? '',
      iconUrl: "https:${json['current']['condition']['icon']}",
    );
  }
}
