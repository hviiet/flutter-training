import 'package:flutter/material.dart';

class ForcastDay {
  final String day;
  final String aqi;
  final String temperature;
  final String? aqiIcon;
  final String? weatherIcon;

  ForcastDay({
    required this.day,
    required this.aqi,
    required this.temperature,
    this.aqiIcon,
    this.weatherIcon,
  });
}

class AqForcast extends StatelessWidget {
  final ForcastDay forcast;

  const AqForcast({super.key, required this.forcast});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            forcast.day,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: 6),
          if (forcast.aqiIcon != null)
            Image.asset(forcast.aqiIcon!, width: 24, height: 24)
          else
            const Icon(
              Icons.emoji_emotions,
              size: 24,
              color: Colors.lightGreenAccent,
            ),
          const SizedBox(height: 6),
          Text(
            forcast.aqi,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 4),
          if (forcast.weatherIcon != null)
            Image.asset(forcast.weatherIcon!, width: 24, height: 24)
          else
            const Icon(Icons.wb_cloudy, size: 24, color: Colors.orange),
          Text(
            forcast.temperature,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
