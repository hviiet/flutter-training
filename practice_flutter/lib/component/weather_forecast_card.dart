import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/weather_forecast_model.dart'; // đường dẫn model của bạn

class WeatherForecastCard extends StatelessWidget {
  final List<ForecastDayModel> forecastDays;

  const WeatherForecastCard({Key? key, required this.forecastDays})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Weather Forecast",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              "Next 7 days",
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 16),

            ListView.separated(
              itemCount: forecastDays.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (_, __) => const Divider(height: 20),
              itemBuilder: (context, index) {
                final day = forecastDays[index];
                final dateStr = DateFormat('EEE dd MMM yy').format(day.date);
                final isToday =
                    DateTime.now().day == day.date.day && DateTime.now().month == day.date.month;

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          dateStr.toUpperCase(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                        if (isToday)
                          const Text(
                            "TODAY",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        else if (index == 1)
                          const Text(
                            "TOMORROW",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "${day.maxTempC.round()}°C ",
                          style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const Text("↑  "),
                        Text(
                          "${day.minTempC.round()}°C ",
                          style: const TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const Text("↓"),
                      ],
                    ),
                    Image.network(
                      day.iconUrl,
                      width: 32,
                      height: 32,
                      errorBuilder: (_, __, ___) =>
                          const Icon(Icons.wb_cloudy, color: Colors.grey),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
