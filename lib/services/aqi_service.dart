import 'package:dio/dio.dart';

class AqiService {
  final Dio _dio = Dio();

  final String _baseUrl = 'https://api.waqi.info/feed';
  final String _token = 'fed6e106a8da8512874b03a6a58aede4bb8413b7'; 

  AqiService();

  Future<Map<String, dynamic>> fetchAqiData(String cityName) async {
    try{
      final resp = await _dio.get(
        '$_baseUrl/$cityName/?token=$_token', 
      );

      return resp.data;
    } catch (e) {
      throw Exception('Failed to load AQI data: $e');
    }
  }
}