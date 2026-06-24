import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_app/models/air_quality_model.dart';

class AirQualityService {
  final dio = Dio();
  final String baseUrl = "https://api.waqi.info//feed/";
  final String apiKey = dotenv.env['AIR_QUALITY_KEY'] ?? "";

  Future<AirQualityModel> getAirQuality(String city) async {
    try {
      final response = await dio.get(
        '$baseUrl$city/',
        queryParameters: {
          'token': apiKey,
        },
      );
      return AirQualityModel.fromJson(response.data);
    } catch (e) {
      print("Error fetching air quality data: $e");
      rethrow;
    }
  }
}