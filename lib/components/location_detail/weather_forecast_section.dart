import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Weather Forecast Section component for Location Detail Page
class WeatherForecastSection extends StatelessWidget {
  final List<dynamic> forecast;

  const WeatherForecastSection({
    super.key,
    required this.forecast,
  });

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final tomorrow = today.add(const Duration(days: 1));

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
            'Weather Forecast',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Next 7 days',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 16),
          ...forecast.map((day) {
            final dateStr = DateFormat('EEE dd MMM yy').format(day.date).toUpperCase();
            
            // Determine if this is today or tomorrow
            String label = '';
            if (day.date.year == today.year && 
                day.date.month == today.month && 
                day.date.day == today.day) {
              label = 'TODAY';
            } else if (day.date.year == tomorrow.year && 
                       day.date.month == tomorrow.month && 
                       day.date.day == tomorrow.day) {
              label = 'TOMORROW';
            }
            
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                children: [
                  SizedBox(
                    width: 120,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          dateStr,
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        if (label.isNotEmpty)
                          Text(
                            label,
                            style: const TextStyle(
                              fontSize: 9,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${day.maxTempC.toInt()}°',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.arrow_forward,
                    size: 14,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${day.minTempC.toInt()}°',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Icon(
                    _getWeatherIcon(day.condition),
                    size: 24,
                    color: Colors.blue,
                  ),
                ],
              ),
            );
          }).toList(),
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
