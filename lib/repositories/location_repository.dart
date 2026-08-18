import '../models/location_details.dart';
import '../services/weather_api_service.dart';

class LocationRepository {
  final WeatherApiService apiService;

  LocationRepository({required this.apiService});

  Future<LocationDetails> getLocationDetails(String city) async {
    // Khởi tạo cả hai Future trước khi await để hai API chạy song song.
    final airFuture = apiService.getAirQualityData(city);
    final weatherFuture = apiService.getWeatherData(city);
    final airQuality = await airFuture;
    final weather = await weatherFuture;

    return LocationDetails(airQuality: airQuality, weather: weather);
  }
}
