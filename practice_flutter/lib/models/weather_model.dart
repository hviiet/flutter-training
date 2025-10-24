import 'weather_hour_model.dart';
import 'weather_forecast_model.dart'; // ✅ thêm dòng này
class WeatherModel {
  final String location;
  final double tempC;
  final double feelslikeC;
  final String conditionText;
  final String iconUrl;
  final List<WeatherHourModel> hourly;
  final List<ForecastDayModel> forecastDays; // ✅ thêm dòng này

  WeatherModel({
    required this.location,
    required this.tempC,
    required this.feelslikeC,
    required this.conditionText,
    required this.iconUrl,
    required this.hourly,
    required this.forecastDays, // ✅
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final forecastDaysJson = json['forecast']?['forecastday'] ?? [];
    List<WeatherHourModel> hourlyList = [];
    List<ForecastDayModel> forecastList = [];

    if (forecastDaysJson.isNotEmpty) {
      // Lấy dữ liệu theo giờ của ngày đầu tiên
      final hours = forecastDaysJson[0]['hour'] as List<dynamic>;
      hourlyList = hours.map((e) => WeatherHourModel.fromJson(e)).toList();

      // Lấy toàn bộ dự báo theo ngày
      forecastList = forecastDaysJson
          .map<ForecastDayModel>((e) => ForecastDayModel.fromJson(e))
          .toList();
    }

    return WeatherModel(
      location: json['location']['name'] ?? '',
      tempC: (json['current']['temp_c'] ?? 0).toDouble(),
      feelslikeC: (json['current']['feelslike_c'] ?? 0).toDouble(),
      conditionText: json['current']['condition']['text'] ?? '',
      iconUrl: "https:${json['current']['condition']['icon']}",
      hourly: hourlyList,
      forecastDays: forecastList, // ✅ truyền vào constructor
    );
  }
}
