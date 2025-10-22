import 'package:dio/dio.dart';
import 'package:flutter_training/models/air_quality_data.dart';

class AirQualityApiService {
  final Dio _dio;
  static const String _baseUrl = 'https://api.waqi.info';
  static const String _token = 'YOUR_TOKEN_HERE'; // Replace with your token from aqicn.org

  AirQualityApiService({Dio? dio}) : _dio = dio ?? Dio(BaseOptions(
    baseUrl: _baseUrl,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ));

  /// Fetch air quality data for a city
  /// [city] can be city name (e.g., 'Birmingham') or coordinates (@lat,lon)
  Future<AirQualityData> getCityAirQuality({required String city}) async {
    try {
      final response = await _dio.get(
        '/feed/$city/',
        queryParameters: {
          'token': _token,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data;
        
        if (data['status'] == 'ok') {
          return AirQualityData.fromJson(data);
        } else {
          throw Exception('API returned error status: ${data['status']}');
        }
      } else {
        throw Exception('Failed to load air quality data: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception('Connection timeout');
      } else if (e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Receive timeout');
      } else if (e.response != null) {
        throw Exception('Error: ${e.response?.statusCode} - ${e.response?.data}');
      } else {
        throw Exception('Network error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  /// Fetch air quality data using geographic coordinates
  Future<AirQualityData> getGeoAirQuality({
    required double latitude,
    required double longitude,
  }) async {
    try {
      final response = await _dio.get(
        '/feed/geo:$latitude;$longitude/',
        queryParameters: {
          'token': _token,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data;
        
        if (data['status'] == 'ok') {
          return AirQualityData.fromJson(data);
        } else {
          throw Exception('API returned error status: ${data['status']}');
        }
      } else {
        throw Exception('Failed to load air quality data: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception('Error: ${e.response?.statusCode} - ${e.response?.data}');
      } else {
        throw Exception('Network error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  /// Search for air quality monitoring stations
  Future<List<String>> searchStations({required String keyword}) async {
    try {
      final response = await _dio.get(
        '/search/',
        queryParameters: {
          'token': _token,
          'keyword': keyword,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data;
        
        if (data['status'] == 'ok') {
          return (data['data'] as List)
              .map((station) => station['station']['name'] as String)
              .toList();
        } else {
          throw Exception('API returned error status: ${data['status']}');
        }
      } else {
        throw Exception('Failed to search stations: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception('Error: ${e.response?.statusCode}');
      } else {
        throw Exception('Network error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}
