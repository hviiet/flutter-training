import 'package:dio/dio.dart';

const AIR_QUALITY_TOKEN = '6e3e9ecd2f39fabd0f2be3347e1464f89df8d1b9';

class AirQualityApi {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> fetchCity({required String city}) async {
    final encoded = Uri.encodeComponent(city);
    final url = 'https://api.waqi.info/feed/$encoded/';
    final res = await _dio.get(
      url,
      queryParameters: {'token': AIR_QUALITY_TOKEN},
    );
    return Map<String, dynamic>.from(res.data);
  }

  Future<Map<String, dynamic>> fetchGeo({
    required double lat,
    required double lon,
  }) async {
    final url = 'https://api.waqi.info/feed/geo:$lat;$lon/';
    final res = await _dio.get(
      url,
      queryParameters: {'token': AIR_QUALITY_TOKEN},
    );
    return Map<String, dynamic>.from(res.data);
  }

  Future<Map<String, dynamic>> fetchHere() async {
    final url = 'https://api.waqi.info/feed/here/';
    final res = await _dio.get(
      url,
      queryParameters: {'token': AIR_QUALITY_TOKEN},
    );
    return Map<String, dynamic>.from(res.data);
  }
}
