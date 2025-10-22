import 'package:flutter/material.dart';
import 'package:flutter_training/models/aqi_scale_info.dart';
import 'package:flutter_training/models/weather_data.dart';
import 'package:flutter_training/views/aqi_scale_page.dart';

/// Air Quality Card component for Location Detail Page
class AirQualityCard extends StatelessWidget {
  final int aqi;
  final AQIScaleInfo aqiInfo;
  final AirQuality? airQuality;

  const AirQualityCard({
    super.key,
    required this.aqi,
    required this.aqiInfo,
    this.airQuality,
  });

  @override
  Widget build(BuildContext context) {
    // Build pollutants list from Weather API air quality data
    final pollutants = <Map<String, dynamic>>[];
    
    if (airQuality != null) {
      if (airQuality!.pm25 != null) {
        pollutants.add({'label': 'PM2.5', 'value': airQuality!.pm25!.toInt()});
      }
      if (airQuality!.pm10 != null) {
        pollutants.add({'label': 'PM10', 'value': airQuality!.pm10!.toInt()});
      }
      if (airQuality!.o3 != null) {
        pollutants.add({'label': 'O₃', 'value': airQuality!.o3!.toInt()});
      }
      if (airQuality!.no2 != null) {
        pollutants.add({'label': 'NO₂', 'value': airQuality!.no2!.toInt()});
      }
      if (airQuality!.co != null) {
        pollutants.add({'label': 'CO', 'value': airQuality!.co!.toInt()});
      }
      if (airQuality!.so2 != null) {
        pollutants.add({'label': 'SO₂', 'value': airQuality!.so2!.toInt()});
      }
    }

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
          Row(
            children: [
              const Text(
                'Air Quality',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AQIScalePage(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.info_outline,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Center(
            child: Column(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: aqiInfo.color,
                      width: 8,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        aqi.toString(),
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: aqiInfo.color,
                        ),
                      ),
                      const Text(
                        'AQI',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(aqiInfo.icon, color: aqiInfo.color, size: 20),
                    const SizedBox(width: 4),
                    Text(
                      aqiInfo.level,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: aqiInfo.color,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          // Pollutants Grid
          if (pollutants.isNotEmpty)
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              childAspectRatio: 1.2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              children: pollutants.take(6).map((pollutant) {
                return _PollutantItem(
                  label: pollutant['label'] as String,
                  value: pollutant['value'].toString(),
                );
              }).toList(),
            )
          else
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Air quality data not available',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _PollutantItem extends StatelessWidget {
  final String label;
  final String value;

  const _PollutantItem({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8FA),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 10,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
