import '../models/air_quality_model.dart';
import 'api_client.dart';

class AirService {
  final ApiClient _apiClient = ApiClient();

  Future<AirQualityModel> fetchAirQuality(String city, String token) async {
    try {
      final response = await _apiClient.getJson(
        '/feed/$city/',
        query: {'token': token},
        overrideBaseUrl: 'https://api.waqi.info',
      );

      if (response is Map && response['status'] == 'ok') {
        // ✅ Parse đúng cấu trúc data
        return AirQualityModel.fromJson(Map<String, dynamic>.from(response));
      } else {
        final message = (response is Map && response['data'] != null)
            ? response['data'].toString()
            : 'Unknown error';
        throw ApiException(400, 'Failed to fetch air quality: $message');
      }
    } catch (e) {
      throw ApiException(500, 'Error fetching air quality: $e');
    }
  }
}
