import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_flutter/business_logic/weather_aqi/weather_aqi_bloc.dart';
import 'package:practice_flutter/business_logic/weather_aqi/weather_aqi_event.dart';
import 'package:practice_flutter/business_logic/weather_aqi/weather_aqi_state.dart';
import 'package:practice_flutter/component/aqi_level_card.dart';

class AqiScaleScreen extends StatefulWidget {
  final String city;
  const AqiScaleScreen({super.key, required this.city});

  @override
  State<AqiScaleScreen> createState() => _AqiScaleScreenState();
}

class _AqiScaleScreenState extends State<AqiScaleScreen> {
  // Cờ để đảm bảo event chỉ được gửi một lần
  bool _isDataFetched = false;

  // --- HÀM SCALE AQI (MỚI) ---
  /// Chuyển đổi chỉ số AQI thô (thường là 0-500) sang thang điểm 1-10.
  int _scaleAqi(double originalAqi) {
    if (originalAqi.isNaN || originalAqi <= 0) return 1;
    double scaled = (originalAqi / 500) * 10;

    // Làm tròn giá trị và đảm bảo nó nằm trong khoảng [1, 10]
    return scaled.round().clamp(1, 10);
  }
  // -------------------------

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_isDataFetched) {
      context.read<WeatherAqiBloc>().add(FetchWeatherAqi(widget.city));
      _isDataFetched = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AQI Scale"), centerTitle: true),
      backgroundColor: const Color(0xFFF7F8FA),
      body: BlocBuilder<WeatherAqiBloc, WeatherAqiState>(
        builder: (context, state) {
          if (state is WeatherAqiLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WeatherAqiError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else if (state is WeatherAqiLoaded) {
            final weather = state.weather;
            final air = state.airQuality;

            // --- TÍNH TOÁN GIÁ TRỊ AQI ĐÃ SCALE ---
            final originalAqi = air.aqi?.toDouble() ?? 0.0;
            final scaledAqi = _scaleAqi(originalAqi);

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header card
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Xử lý iconUrl an toàn
                          (weather.iconUrl != null &&
                                  weather.iconUrl.isNotEmpty)
                              ? Image.network(
                                  weather.iconUrl,
                                  width: 48,
                                  height: 48,
                                  errorBuilder: (context, error, stackTrace) =>
                                      const Icon(
                                        Icons.cloud_queue,
                                        size: 48,
                                        color: Colors.grey,
                                      ),
                                )
                              : const Icon(
                                  Icons.cloud_queue,
                                  size: 48,
                                  color: Colors.grey,
                                ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  weather.location,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "${weather.tempC.toStringAsFixed(1)}°C • ${weather.conditionText}",
                                  style: const TextStyle(fontSize: 14),
                                ),
                                Text(
                                  "Feels like ${weather.feelslikeC.toStringAsFixed(1)}°C",
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                scaledAqi.toString(),
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text("AQI (1-10)"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                  const AqiLevelCard(
                    title: "Low",
                    indexRange: "1 to 3",
                    color: Colors.green,
                    icon: Icons.sentiment_satisfied_alt, 
                  ),
                  const AqiLevelCard(
                    title: "Moderate",
                    indexRange: "4 to 6",
                    color: Colors.orange,
                    icon: Icons.sentiment_neutral, 
                  ),
                  const AqiLevelCard(
                    title: "High",
                    indexRange: "7 to 8",
                    color: Colors.red,
                    icon: Icons.masks, 
                  ),
                  const AqiLevelCard(
                    title: "Very High",
                    indexRange: "9 to 10",
                    color: Colors.purple,
                    icon: Icons.sick, 
                  ),
                ],
              ),
            );
          }

          return const Center(child: Text("No data"));
        },
      ),
    );
  }
}
