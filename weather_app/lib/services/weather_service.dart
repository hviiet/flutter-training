import 'package:dio/dio.dart';

class WeatherService {
  final dio = Dio();
  final String baseUrl = "https://api.waqi.info/";
  final String apiKey = "YOUR_API_KEY"; // Replace with your actual API key
}