import 'package:dio/dio.dart';

import '../repositories/location_repository.dart';
import '../services/weather_api_service.dart';

/// Khởi tạo và lưu giữ các dependency dùng chung trong ứng dụng.
final class AppDependencies {
  final LocationRepository locationRepository;

  const AppDependencies._({required this.locationRepository});

  factory AppDependencies.create() {
    const aqicnToken = String.fromEnvironment(
      'AQICN_TOKEN',
      defaultValue: 'ab5be9511f1cbd53fab19386f44ecb55da92a3d4',
    );
    const weatherApiKey = String.fromEnvironment(
      'WEATHER_API_KEY',
      defaultValue: 'c172a97ff41c4dcead021123261108',
    );

    final dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
      ),
    );

    final weatherApiService = WeatherApiService(
      dio: dio,
      aqicnToken: aqicnToken,
      weatherApiKey: weatherApiKey,
    );

    return AppDependencies._(
      locationRepository: LocationRepository(apiService: weatherApiService),
    );
  }
}
