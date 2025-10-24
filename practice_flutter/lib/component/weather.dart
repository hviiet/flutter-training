import 'package:flutter/material.dart';
import '../models/weather_model.dart';
import '../models/weather_hour_model.dart';

class WeatherCard extends StatelessWidget {
  final WeatherModel currentWeather;
  final List<WeatherHourModel> hourlyData;

  const WeatherCard({
    Key? key,
    required this.currentWeather,
    required this.hourlyData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Weather",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            // ☁️ Phần thời tiết hiện tại
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currentWeather.conditionText,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Feels like ${currentWeather.feelslikeC.toStringAsFixed(1)}°C",
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "${currentWeather.tempC.toStringAsFixed(0)}°C",
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Image.network(
                      currentWeather.iconUrl,
                      width: 48,
                      height: 48,
                      errorBuilder: (_, __, ___) =>
                          const Icon(Icons.cloud, size: 40, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 20),

            // 🌤 List dự báo từng giờ
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: hourlyData.length,
                itemBuilder: (context, index) {
                  final hour = hourlyData[index];
                  final timeString = hour.time.split(' ').last; // lấy "09:00"

                  return Container(
                    width: 70,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 6,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.network(
                          hour.iconUrl,
                          width: 32,
                          height: 32,
                          errorBuilder: (_, __, ___) =>
                              const Icon(Icons.cloud, size: 30),
                        ),
                        Text(
                          "${hour.tempC.toStringAsFixed(0)}°C",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          timeString,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
