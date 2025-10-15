import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_flutter/business_logic/weather_aqi/weather_aqi_bloc.dart';
import 'package:practice_flutter/business_logic/weather_aqi/weather_aqi_event.dart';
import 'package:practice_flutter/business_logic/weather_aqi/weather_aqi_state.dart';
import 'package:practice_flutter/component/air_quality_rate_card.dart';
import 'package:practice_flutter/component/aqi_forecast_card.dart';
import 'package:practice_flutter/services/weather_service.dart';
import 'package:practice_flutter/services/air_service.dart';

class AqiScaleScreen extends StatefulWidget {
  final String city; 
  const AqiScaleScreen({Key? key, this.city = "Birmingham"}) : super(key: key);
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
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        title: Text("Chỉ số AQI hôm nay (${widget.city})"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocBuilder<WeatherAqiBloc, WeatherAqiState>(
        builder: (context, state) {
          if (state is WeatherAqiLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WeatherAqiLoaded) {
            final weather = state.weather;
            final air = state.airQuality;

            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // 🌤 Thông tin thời tiết
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Column(
                      children: [
                        Text(
                          weather.location,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "${weather.tempC.toStringAsFixed(1)}°C • ${weather.conditionText}",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Image.network(weather.iconUrl, width: 64, height: 64),
                      ],
                    ),
                  ),

                  // 🌫 Chỉ số AQI hiện tại
                  AirQualityRateCard(aqiData: air),

                  const SizedBox(height: 10),

                  // 📊 Biểu đồ AQI dự báo thật 
                  if (air.forecast != null && air.forecast!.isNotEmpty)
                    AqiForecastCard(forecastData: air.forecast!)
                  else
                    const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'Không có dữ liệu dự báo AQI',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                ],
              ),
            );
          } else if (state is WeatherAqiError) {
            return Center(
              child: Text(
                'Lỗi: ${state.message}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          }
          return const Center(child: Text('Chưa có dữ liệu.'));
        },
      ),
    );
  }
}
