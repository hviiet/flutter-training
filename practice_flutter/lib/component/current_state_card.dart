import 'package:flutter/material.dart';

class CurrentStateCard extends StatelessWidget {
  final String location;
  final String city;
  final String temperature;
  final String weather;
  final String feelsLike;
  final int aqi;
  final IconData weatherIcon;
  final IconData aqiIcon;
  final List<ForecastDay> forecast;

  const CurrentStateCard({
    super.key,
    required this.location,
    required this.city,
    required this.temperature,
    required this.weather,
    required this.feelsLike,
    required this.aqi,
    required this.weatherIcon,
    required this.aqiIcon,
    required this.forecast,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Location & AQI Row
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.location_on, color: Colors.blue),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        location,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(city, style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Text(
                      '$aqi AQI',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(aqiIcon, color: Colors.green),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Weather Row
            Row(
              children: [
                Icon(weatherIcon, size: 32, color: Colors.blue),
                const SizedBox(width: 8),
                Text(
                  temperature,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8),
                Text(weather, style: const TextStyle(fontSize: 16)),
                const SizedBox(width: 8),
                Text(
                  'Feels like $feelsLike',
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Forecast
            const Text(
              'Forecast',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 110, // tăng từ 90 lên 110
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: forecast.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final day = forecast[index];
                  return Container(
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 4,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          day.day,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        Icon(day.aqiIcon, color: Colors.green, size: 18),
                        Text(
                          '${day.aqi} AQI',
                          style: const TextStyle(fontSize: 10),
                        ),
                        Icon(day.weatherIcon, color: Colors.blue, size: 18),
                        Text(
                          '${day.temp}°C',
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            // Dots indicator
            const SizedBox(height: 8),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  4,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    width: index == 1 ? 16 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: index == 1
                          ? Colors.blue
                          : Colors.blue.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ForecastDay {
  final String day;
  final int aqi;
  final IconData aqiIcon;
  final IconData weatherIcon;
  final int temp;

  ForecastDay({
    required this.day,
    required this.aqi,
    required this.aqiIcon,
    required this.weatherIcon,
    required this.temp,
  });
}
