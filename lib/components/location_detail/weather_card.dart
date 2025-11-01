import 'package:flutter/material.dart';
import 'package:flutter_training/models/weather_data.dart';

/// Weather Card component for Location Detail Page
class WeatherCard extends StatelessWidget {
  final Current current;
  final List<HourlyForecast> hourlyForecast;

  const WeatherCard({
    super.key,
    required this.current,
    required this.hourlyForecast,
  });

  @override
  Widget build(BuildContext context) {
    // Get hourly forecast - show 7-8 hours starting from current or next hour
    final now = DateTime.now();
    
    // Find the starting index (current hour or next available hour)
    int startIndex = hourlyForecast.indexWhere((hour) => 
      hour.time.hour >= now.hour && 
      hour.time.day >= now.day
    );
    
    // If not found or negative, start from beginning
    if (startIndex < 0) startIndex = 0;
    
    // Take 8 hours from start index
    final displayHours = hourlyForecast
        .skip(startIndex)
        .take(8)
        .toList();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Weather',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'NOW',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    current.condition,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Feels like ${current.feelsLikeC.toInt()}°C',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${current.tempC.toInt()}°',
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    _getWeatherIcon(current.condition),
                    size: 48,
                    color: Colors.blue,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Hourly forecast timeline
          SizedBox(
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: displayHours.length,
              itemBuilder: (context, index) {
                final hour = displayHours[index];
                final timeStr = '${hour.time.hour.toString().padLeft(2, '0')}:00';
                
                return Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        _getWeatherIcon(hour.condition),
                        size: 32,
                        color: Colors.blue.shade400,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        '${hour.tempC.toInt()}°',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        timeStr,
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          // Indicator dots
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 3),
                width: index == 0 ? 20 : 6,
                height: 6,
                decoration: BoxDecoration(
                  color: index == 0 ? Colors.blue : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  IconData _getWeatherIcon(String condition) {
    final lowerCondition = condition.toLowerCase();
    if (lowerCondition.contains('rain') || lowerCondition.contains('shower')) {
      return Icons.water_drop;
    } else if (lowerCondition.contains('cloud')) {
      return Icons.cloud;
    } else if (lowerCondition.contains('sun') || lowerCondition.contains('clear')) {
      return Icons.wb_sunny;
    } else if (lowerCondition.contains('snow')) {
      return Icons.ac_unit;
    } else {
      return Icons.wb_cloudy;
    }
  }
}
