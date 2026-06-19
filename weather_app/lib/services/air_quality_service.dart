import 'package:dio/dio.dart';

class AirQualityService {
  final dio = Dio();
  final String baseUrl = "https://api.waqi.info//feed/";
  final String apiKey = "cb6f142caf8ecf2c6c4ebb423cc6b527b7986ff4";

  Future<Map<String, dynamic>> getAirQuality(String city) async {
    try {
      final response = await dio.get(
        '$baseUrl$city/',
        queryParameters: {
          'token': apiKey,
        },
      );
      return response.data;
    } catch (e) {
      print("Error fetching air quality data: $e");
      throw e;
    }
  }
}