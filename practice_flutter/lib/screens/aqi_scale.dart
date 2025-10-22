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
  @override
  void initState() {
    super.initState();
    context.read<WeatherAqiBloc>().add(FetchWeatherAqi(widget.city));
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
                          Image.network(
                            weather.iconUrl,
                            width: 48,
                            height: 48,
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
                                air.aqi?.toString() ?? "-",
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text("AQI"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // AQI levels
                  const AqiLevelCard(
                    title: "Low",
                    indexRange: "1 to 3",
                    color: Colors.green,
                    emoji: "😊",
                  ),
                  const AqiLevelCard(
                    title: "Moderate",
                    indexRange: "4 to 6",
                    color: Colors.orange,
                    emoji: "😐",
                  ),
                  const AqiLevelCard(
                    title: "High",
                    indexRange: "7 to 8",
                    color: Colors.red,
                    emoji: "😷",
                  ),
                  const AqiLevelCard(
                    title: "Very High",
                    indexRange: "9 to 10",
                    color: Colors.purple,
                    emoji: "🤒",
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
